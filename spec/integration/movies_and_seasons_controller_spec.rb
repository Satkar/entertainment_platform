require 'swagger_helper'

describe 'Movies And Seasons API' do

  path '/api/v1/gallery_items' do

    get 'An endpoint to return both movies and seasons, ordered by creation' do
      tags 'Movies And Seasons'
      produces 'application/json'
      
      response '200', "" do
        run_test!
      end

    end
  end
end