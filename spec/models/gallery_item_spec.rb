require 'rails_helper'

RSpec.describe GalleryItem, type: :model do
  it "should raise an error Plot can't be blank" do 
    expect{ FactoryBot.create(:gallery_item_with_empty_plot) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Plot can't be blank")
  end

  it "should raise an error Title can't be blank" do 
    expect{ FactoryBot.create(:gallery_item_with_empty_title) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank")
  end
end