require 'swagger_helper'

describe 'Movies API' do

  path '/api/v1/movies' do

    get 'An endpoint to returns  movies, ordered by creation' do
      tags 'Movies'
      produces 'application/json'
      
      response '200', "" do
        run_test!
      end
    end
  end
end