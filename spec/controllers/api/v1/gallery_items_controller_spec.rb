require 'rails_helper'

RSpec.describe Api::V1::GalleryItemsController do
  describe "#index" do 
    
    before(:each) do 
      Rails.cache.delete("movies_and_seasons")
    end
    
    context "When there are no gallery items present in the system" do 
      it "should return empty array" do 
        get :index
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq([])
      end 
    end

    context "when there are gallery items in the system" do
      
      before do 
        FactoryBot.create_list(:random_movie, 10)
        FactoryBot.create_list(:random_season, 10)
      end

      it "should return gallary items with ascending order of creation date" do 
        get :index
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).map{|r| r['id']}).to eq(GalleryItem.movie_and_seasons.ordered_by_creation.map(&:id))
      end

    end

    describe "pagination" do

      before do 
        FactoryBot.create_list(:random_season, 50)
        FactoryBot.create_list(:random_movie, 50)
      end

      let(:expected_record_ids) { GalleryItem.fetch_and_cache.paginate(page: page, per_page: per_page).map(&:id) }
      
      context "when request does not have pagination parameters" do
        
        let(:page) { 1 }
        let(:per_page) { 25 }

        it "should return first 25 records if there are more than 25 records" do 
          get :index
          expect(response.status).to eq(200)
          
          records = JSON.parse(response.body)
          
          expect(records.count).to eq(25)
          expect(records.map{|r| r['id']}).to eq(expected_record_ids)
        end  
      end


      context "when request has pagination parameters" do
      
        let(:page) { 2 }
        let(:per_page) { 3 }

        it "should return expected count and right records" do 
          get :index, params: { page: page, per_page: per_page }
          expect(response.status).to eq(200)
          
          records = JSON.parse(response.body)
          
          expect(records.count).to eq(per_page)
          expect(records.map{|r| r['id']}).to eq(expected_record_ids)
        end  
      end
    end
  end
end