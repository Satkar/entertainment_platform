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
  end
end