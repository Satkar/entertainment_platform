require 'rails_helper'

RSpec.describe Api::V1::GalleryItemsController do
  describe "#index" do 
    
    context "When there are no gallery items presnet in the system" do 
      it "should return empty hash" do 
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

      it "should return gallary items with ascending order for creation date" do 
        get :index
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).map{|r| r['id']}).to match_array(GalleryItem.movie_and_seasons.ordered_by_creation.map(&:id))
      end

    end
  end
end