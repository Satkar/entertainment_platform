require 'rails_helper'

RSpec.describe LibraryItem do

  context "when movie or season id is missing" do 
    it "returns validation error" do 
      expect{ FactoryBot.create(:library_item_without_gallery_item) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Gallery item must be provided.")
    end
  end

  context "when purchase_option_id is missing" do 
    it "returns validation error" do 
      expect{ FactoryBot.create(:library_item_without_purchase_option) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Purchase option must exist")
    end
  end

  context "when user_id is missing" do 
    it "returns validation error" do 
      expect{ FactoryBot.create(:library_item_without_user) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: User must exist")
    end
  end

  context "when all attributes are valid" do 
    it "returns true" do 
      expect(FactoryBot.create(:library_item)).to eq(LibraryItem.last)
    end
  end

end