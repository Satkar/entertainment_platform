require 'swagger_helper'

describe 'Seasons API' do

  path '/api/v1/seasons' do

    get 'An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number.' do
      tags 'Seasons'
      produces 'application/json'
      parameter name: :page, in: :query, description: 'Page Number', type: :string
      parameter name: :per_page, in: :query, description: 'Number of records per page', type: :string
      
      response '200', "List seasons ordered by creation, including the list of episodes ordered by its number." do
        let(:page) { 1 }
        let(:per_page) { 5 }
        run_test!
      end
    end
  end
end