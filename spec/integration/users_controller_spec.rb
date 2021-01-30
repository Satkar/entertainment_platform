require 'swagger_helper'

describe 'Users API' do

  path '/api/v1/users' do
    get 'An endpoint to list Users' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :page, in: :query, description: 'Page Number', type: :string
      parameter name: :per_page, in: :query, description: 'Number of records per page', type: :string
      
      response '200', "Listing all the users" do
        let(:page) { 1 }
        let(:per_page) { 5 }
        run_test!
      end

    end
  end

  path '/api/v1/users' do

    post 'An endpoint to create Users' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :"user[email]", in: :query, type: :string, required: true
      request_body_json schema: {
        type: :object,
        properties: {
          email: { type: :string },
        },
        required: [ 'email']
      }
      
      response '200', "User successfully created" do
        let(:"user[email]") { 'sansat1387@gmail.com' }
        run_test!
      end

      response '400', "Failed due to invalid email or user already exists" do
        let(:user) { FactoryBot.create(:user, email: 'sansat1387@gmail.com') }
        let(:"user[email]") { user.email }
        run_test!
      end
    end
  end
end