require 'rails_helper'

RSpec.describe Api::V1::PurchasesController do
  describe "#index" do 
    
    context "When there are no active subscriptions for user" do
      
      let(:user) { FactoryBot.create(:user) }
      
      let(:params) {{ "user_id" => user.id }}
      it "should return empty array" do 
        get :index, params: { user_id: user.id }
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq([])
      end 
    end

    context "when there are active subscriptions for user" do
      before do 
        FactoryBot.create_list(:library_item, 10, user_id: user.id)
      end

      let(:user) { FactoryBot.create(:user) }
    
      it "should return all active subscription" do 
        get :index, params: { user_id: user.id }
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).map{|r| r['id']}).not_to eq([])
      end
      
    end
  end

  describe "#create" do
    
    let(:user) { FactoryBot.create(:user) }
    let(:gallery_item) { FactoryBot.create(:movie_with_sd_quality)}
    let(:purchase_option) { gallery_item.purchase_options.first }
    

    context "When user does not exist" do
      it "should return error message" do 
        post :create, params: { user_id: 55 }
        expect(response.status).to eq(404)
        expect(JSON.parse(response.body)).to eq({"error"=>"Couldn't find User with 'id'=55"})
      end 
    end

    context "When Movie or season does not exist with the id provided" do
      
      it "should return error message" do 
        post :create, params: { user_id: user.id, gallery_item_id: 11, purchase_option_id: purchase_option.id }
        expect(response.status).to eq(404)
        expect(JSON.parse(response.body)).to eq({"error"=>"Couldn't find GalleryItem with 'id'=11"})
      end 
    end

    context "When purchase option not exist with the id provided" do
      
      it "should return error message" do 
        post :create, params: { user_id: user.id, gallery_item_id: gallery_item.id, purchase_option_id: 11 }
        expect(response.status).to eq(404)
        expect(JSON.parse(response.body)).to eq({"error"=>"Couldn't find PurchaseOption with 'id'=11 [WHERE `gallery_items_purchase_options`.`gallery_item_id` = ?]"})
      end 
    end
  
    context "When there are no active subscriptions for user" do
      it "should return success message" do 
        post :create, params: { user_id: user.id, gallery_item_id: gallery_item.id, purchase_option_id: purchase_option.id }
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq({"message"=>"Subscribed successfully."})
      end 
    end

    context "When previous subscription is still active" do

      before do 
        FactoryBot.create(
          :library_item, 
          user_id: user.id, 
          gallery_item_id: gallery_item.id, 
          purchase_option_id: purchase_option.id
        )
      end

      let(:remaining_time) { LibraryItem.last.calculate_remaining_time }

      it "should return duplicate subscription message" do 
        post :create, params: { user_id: user.id, gallery_item_id: gallery_item.id, purchase_option_id: purchase_option.id }
        expect(response.status).to eq(409)
        expect(JSON.parse(response.body)).to eq({"message"=>"Your can try this subscription after #{remaining_time}!"})
      end 
    end
    
  end
end