require 'swagger_helper'

describe 'Users API' do

  path '/api/v1/users' do

    post 'An endpoint to create Users' do
      tags 'Users'
      consumes 'application/json'
      request_body_json schema: {
        type: :object,
        properties: {
          email: { type: :string },
        },
        required: [ 'email']
      }
      
      response '200', "User successfully created" do
        let(:user) { { 'email': 'sansat1387@gmail.com'} }
        run_test!
      end

      response '400', "Failed due to invalid email or user already exists" do
        let(:user) { {email: 'sansat1387@gmail.com'} }
        run_test!
      end
    end
  end
end