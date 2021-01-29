require 'swagger_helper'

describe 'Users API' do

  path '/api/v1/users' do
    get 'An endpoint to list Users' do
      tags 'Users'
      consumes 'application/json'
      
      response '200', "Listing all the users" do
        run_test!
      end

    end
  end

  path '/api/v1/users?user[email]={email}' do

    post 'An endpoint to create Users' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :email, :in => :path, :type => :string
      request_body_json schema: {
        type: :object,
        properties: {
          email: { type: :string },
        },
        required: [ 'email']
      }
      
      response '200', "User successfully created" do
        let(:email) { 'sansat1387@gmail.com' }
        run_test!
      end

      response '400', "Failed due to invalid email or user already exists" do
        let(:user) { FactoryBot.create(:user, email: 'sansat1387@gmail.com') }
        let(:email) { user.email }
        run_test!
      end
    end
  end
end