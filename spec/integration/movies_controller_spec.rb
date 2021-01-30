require 'swagger_helper'

describe 'Movies API' do

  path '/api/v1/movies' do

    get 'An endpoint to returns movies, ordered by creation' do
      tags 'Movies'
      produces 'application/json'
      parameter name: :page, in: :query, description: 'Page Number', type: :string
      parameter name: :per_page, in: :query, description: 'Number of records per page', type: :string
      
      response '200', "Lists movies, ordered by creation" do
        let(:page) { 1 }
        let(:per_page) { 5 }
        run_test!
      end
    end
  end
end