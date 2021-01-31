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
  end
end