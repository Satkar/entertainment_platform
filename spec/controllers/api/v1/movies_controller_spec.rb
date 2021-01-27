require 'rails_helper'

RSpec.describe Api::V1::MoviesController do
  describe "#index" do 
    
    context "When there are no movies presnet in the system" do 
      it "should return empty array" do 
        get :index
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq([])
      end 
    end

    context "when there are movies in the system" do
      
      before do 
        FactoryBot.create_list(:random_movie, 10)
        FactoryBot.create_list(:random_season, 10)
      end

      it "should return movies with ascending order for creation date" do 
        get :index
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).map{|r| r['id']}).to match_array(Movie.all.map(&:id))
      end
      
    end
  end
end