require 'swagger_helper'

describe 'User Purchases API' do

  path '/api/v1/users/{user_id}/purchases' do

    get 'An endpoint to get the library of a user ordered by the remaining time to watch the content.' do
      tags 'User Library'
      produces 'application/json'
      parameter name: :user_id, :in => :path, :type => :integer
      parameter name: :page, in: :query, description: 'Page Number', type: :string
      parameter name: :per_page, in: :query, description: 'Number of records per page', type: :string

      response '200', "returns list of user's library with active subscription" do
        let(:user_id) { FactoryBot.create(:user).id }
        let(:page) { 1 }
        let(:per_page) { 5 }
        run_test!
      end

      response '404', "user not found error" do
        let(:user_id) { 100 }
        let(:page) { 1 }
        let(:per_page) { 5 }
        run_test!
      end
    end
  end


  path '/api/v1/users/{user_id}/purchases' do

    post 'An endpoint for a user to perform a purchase of a content.' do
      tags 'User Library'
      parameter name: :user_id, in: :path, type: :integer, description: 'User Id'
      parameter name: :"purchase[gallery_item_id]", in: :query, type: :integer, description: 'Movie or Season ID'
      parameter name: :"purchase[purchase_option_id]", in: :query, type: :integer, description: 'Purchase Option ID'
      consumes 'application/json'
      request_body_json schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          gallery_item_id: { type: :integer },
          purchase_option_id: { type: :integer }
        },
        required: [ 'gallery_item_id', 'purchase_option_id' ]
      }

      response '200', 'Subscription Successfully created' do
        let(:user_id) { FactoryBot.create(:user).id }
        let(:movie) { FactoryBot.create(:movie_with_sd_quality) }
        let(:"purchase[gallery_item_id]") { movie.id }
        let(:"purchase[purchase_option_id]") { movie.purchase_options.first.id}
        run_test!
      end

      response '409', 'previous subscription is still active!' do
        let(:movie) { FactoryBot.create(:movie_with_sd_quality) }
        
        let(:library_item) do 
          FactoryBot.create(
              :library_item, 
              gallery_item_id: movie.id, 
              purchase_option_id: movie.purchase_options.first.id 
          ) 
        end

        let(:user_id) { library_item.user_id }
        let(:"purchase[gallery_item_id]") { library_item.gallery_item_id }
        let(:"purchase[purchase_option_id]") { library_item.purchase_option_id }
        
        run_test!
      end

      response '404', 'Movie/Season, User or Purchase option not found' do
        let(:library_item) { FactoryBot.create(:library_item) }
        let(:user_id) { library_item.user_id }
        let(:"purchase[gallery_item_id]") { 50 }
        let(:"purchase[purchase_option_id]") { library_item.purchase_option_id }
        
        run_test!
      end
    end
  end
end