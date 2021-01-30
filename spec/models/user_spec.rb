require 'rails_helper'

RSpec.describe User do

  context "While creating a user if email is not provided" do
    subject { FactoryBot.create(:user_without_email)}
    
    it "should return a message email is required" do
      expect{ subject }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email is invalid, Email can't be blank")
    end

  end

  context "While creating a user if email is invalid" do
    subject { FactoryBot.create(:user_with_invalid_email)}
    
    it "should return invalid email error" do
      expect{ subject }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Email is invalid')
    end
  end

  context "While creating a user if user alreaady exists with the same email" do
    
    let(:last_user) { FactoryBot.create(:user) }

    subject { FactoryBot.create(:user, email: last_user.email)}
    it "should return user exist error" do 
      expect{ subject }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Email has already been taken')
    end
  end


  context "While creating a user if user does not exists with the email" do
    
    subject { FactoryBot.create(:user)}
    
    it "should return true" do 
      expect(subject).to eq(User.last)
    end
  end

  describe "#purchase_now" do
    subject { user.purchase_now(gallery_item, purchase_option) }
  
    context "when user does not have a active subscription" do
      let(:user) { FactoryBot.create(:user)}
      let(:gallery_item) { FactoryBot.create(:gallery_item)}
      let(:purchase_option) { FactoryBot.create(:sd_price)} 
      
      it "should create a new subscription and return true" do
        expect(subject).to eq(true)
      end
    end 

    context "When subscriptiion is not yet expired" do
      let(:subscription) { FactoryBot.create(:library_item) }

      let(:user) { subscription.user}
      let(:gallery_item) { subscription.gallery_item}
      let(:purchase_option) { subscription.purchase_option}
      
      it "should return remaining time" do
        expect(subject).to eq(subscription.calculate_remaining_time)
      end
    end
  end

end