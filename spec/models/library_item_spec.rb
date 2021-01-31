require 'rails_helper'

RSpec.describe LibraryItem do

  describe ".create" do 
    context "when movie or season id is missing" do 
      it "returns validation error" do 
        expect{ FactoryBot.create(:library_item_without_gallery_item) }.to raise_error(
          ActiveRecord::RecordInvalid, "Validation failed: Gallery item must exist, Gallery item must be provided."
        )
      end
    end

    context "when purchase_option_id is missing" do 
      it "returns validation error" do 
        expect{ FactoryBot.create(:library_item_without_purchase_option) }.to raise_error(
          ActiveRecord::RecordInvalid, "Validation failed: Purchase option must exist"
          )
      end
    end

    context "when user_id is missing" do 
      it "returns validation error" do 
        expect{ FactoryBot.create(:library_item_without_user) }.to raise_error(
          ActiveRecord::RecordInvalid, "Validation failed: User must exist"
          )
      end
    end

    context "when all attributes are valid" do 
      it "returns library item object" do 
        expect(FactoryBot.create(:library_item)).to eq(LibraryItem.last)
      end
    end
  end

  describe "#calculate_remaining_time" do   
    subject { library_item.calculate_remaining_time }
    
    context "when library item is exipred" do
      
      let(:library_item) { FactoryBot.create(:library_item, expires_at: DateTime.now - 1.day) }
      
      it "should return nil" do 
        expect(subject).to eq(nil)
      end 
    end

    context "when library item is not exipred" do
      
      let(:library_item) { FactoryBot.create(:library_item) }
      
      it "should return remaining Time" do 
        expect(subject).to eq("2 day/s ")
      end 
    end
  end

end