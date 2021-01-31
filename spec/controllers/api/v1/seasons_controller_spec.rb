require 'rails_helper'

RSpec.describe Api::V1::SeasonsController do
  describe "#index" do 
    
    before(:each) do 
      Rails.cache.delete('seasons_with_episodes')
      Rails.cache.delete('movies_and_seasons')
    end

    context "When there are no seasons present in the system" do 
      it "should return empty array" do
        get :index
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq([])
      end 
    end

    context "when there are seasons in the system" do
      
      before do 
        FactoryBot.create_list(:random_season, 10)
      end

      it "should return seasons with ascending order of creation date" do 
        get :index
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).map{|r| r['id']}).to eq(Season.all.map(&:id))
      end
      
    end

    context "when there are seasons with episode in the system" do
      
      before do 
        FactoryBot.create(:random_season)
      end

      it "should return seasons with ascending order of creation date, including the list of episodes ordered by its number" do 
        get :index
        expect(response.status).to eq(200)
        parsed_response = JSON.parse(response.body)
        season_ids = parsed_response.map{|r| r['id']}
        
        episode_serial_num = parsed_response[0]['episodes'].map{|r| r['serial_num']}
        
        episodes = Episode.where(season_id: season_ids)
        expect(episode_serial_num).to eq(episodes.map(&:serial_num))
      end
      
    end

    describe "pagination" do

      before do 
        FactoryBot.create_list(:random_season, 50)
      end

      let(:expected_record_ids) { Season.fetch_and_cache.paginate(page: page, per_page: per_page).map(&:id) }
      
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