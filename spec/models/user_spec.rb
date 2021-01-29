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
    before do 
      FactoryBot.create(:user)
    end

    subject { FactoryBot.create(:user)}
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

end