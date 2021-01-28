require 'swagger_helper'

describe 'Seasons API' do

  path '/api/v1/seasons' do

    get 'An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number.' do
      tags 'Seasons'
      produces 'application/json'
      
      response '200', "" do
        run_test!
      end
    end
  end
end