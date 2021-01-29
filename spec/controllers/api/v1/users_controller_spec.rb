require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  describe "#create" do 

    let(:user) {{ "user" => { "email" => email } }}
  
    context "While creating a user if email is not provided" do
      let(:email) { nil }
      it "should return a message email is required" do
        post :create, params: user
        expect(response.status).to eq(400)
        expect(JSON.parse(response.body)).to eq({"error"=>"Validation failed: Email is invalid, Email can't be blank"})
      end

    end

    context "While creating a user if email is invalid" do
      
      let(:email) { 'abc.com' }
      it "should return invalid email error" do
        post :create, params: user
        expect(response.status).to eq(400)
        expect(JSON.parse(response.body)).to eq({"error"=>"Validation failed: Email is invalid"})
      end
    end

    context "While creating a user if user alreaady exists with the same email" do
      before do 
        FactoryBot.create(:user, email: 'sansat1387@gmail.com')
      end

      let(:email) { 'sansat1387@gmail.com' }
      it "should return user exist error" do 
        post :create, params: user
        expect(response.status).to eq(400)
        expect(JSON.parse(response.body)).to eq({"error"=>"Validation failed: Email has already been taken"})
      end
    end


    context "While creating a user if user does not exists with the email" do
      
      let(:email) { 'sansat1387@gmail.com' }
      it "should return true" do 
        post :create, params: user
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)['id']).to eq(User.last.id)
      end
    end
  end
end
