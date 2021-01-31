require 'rails_helper'

RSpec.describe Api::V1::PurchasesController do
  
  let(:user) { FactoryBot.create(:user) }
  
  describe "#index" do 
  
    let(:params) {{ user_id: user.id }}
    
    context "When there are no active subscriptions for user" do
        
      it "should return empty array" do 
        get :index, params: params
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq([])
      end 
    end

    context "when there are active subscriptions for user" do
      before do 
        FactoryBot.create_list(:library_item, 10, user_id: user.id)
      end

      it "should return all active subscription" do 
        get :index, params: params
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).map{|r| r['id']}).not_to eq([])
      end
      
    end

    describe "pagination" do

      before do 
        FactoryBot.create_list(:library_item, 50, user_id: user.id)
      end

      let(:expected_record_ids) { user.library.paginate(page: page, per_page: per_page).map(&:id) }
      
      context "when request does not have pagination parameters" do
        
        let(:page) { 1 }
        let(:per_page) { 25 }

        it "should return first 25 records if there are more than 25 records" do 
          get :index, params: params
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
          get :index, params: { page: page, per_page: per_page }.merge(params)
          expect(response.status).to eq(200)
          
          records = JSON.parse(response.body)
          
          expect(records.count).to eq(per_page)
          expect(records.map{|r| r['id']}).to eq(expected_record_ids)
        end  
      end
    end
  end

  describe "#create" do
    
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
        post :create, params: { user_id: user.id, purchase: { gallery_item_id: 11, purchase_option_id: purchase_option.id } }
        expect(response.status).to eq(404)
        expect(JSON.parse(response.body)).to eq({"error"=>"Couldn't find GalleryItem with 'id'=11"})
      end 
    end

    context "When purchase option not exist with the id provided" do
      
      it "should return error message" do 
        post :create, params: { user_id: user.id, purchase: { gallery_item_id: gallery_item.id, purchase_option_id: 11 } }
        expect(response.status).to eq(404)
        expect(JSON.parse(response.body)).to eq({"error"=>"Couldn't find PurchaseOption with 'id'=11"})
      end 
    end
  
    context "When there are no active subscriptions for user with gallery_item and purchase option" do
      it "should return success message" do 
        post :create, params: { user_id: user.id, purchase: { gallery_item_id: gallery_item.id, purchase_option_id: purchase_option.id } }
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to eq({"message"=>"Subscribed successfully."})
      end 
    end

    context "When previous subscription is still active for the provided gallery_item_id and purchase_option_id" do

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
        post :create, params: { user_id: user.id, purchase: { gallery_item_id: gallery_item.id, purchase_option_id: purchase_option.id }  }
        expect(response.status).to eq(409)
        expect(JSON.parse(response.body)).to eq({"message"=>"Your can try this subscription after #{remaining_time}!"})
      end 
    end
    
  end
end