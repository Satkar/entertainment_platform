require 'rails_helper'

RSpec.describe Movie do

  before do 
    Rails.cache.delete('movies')
    FactoryBot.create_list(:random_movie, 10)
  end

  subject(:movies) { Movie.fetch_and_cache }

  describe ".fetch_and_cache" do  
    context "when data is not cached" do 
      it "returns nil for the cache key movies" do 
        expect(Rails.cache.fetch('movies')).to eq(nil)
      end
    end

    context "when data is cached" do 
      it "should not return nil for the cache key movies" do 
        expect(subject).not_to be_nil
        expect(Rails.cache.fetch('movies')).not_to be_nil
      end
    end
  end

  context "When new movie is created" do 
    it "should flush the cache" do
      expect(subject).not_to be_nil
      expect(Rails.cache.fetch('movies')).not_to be_nil
      
      # Creating new movie
      Movie.create(FactoryBot.attributes_for :random_movie)
      
      expect(Rails.cache.fetch('movies')).to be_nil
    end
  end

  context "When movie is Updated" do 
    it "should flush the cache" do
      expect(subject).not_to be_nil
      expect(Rails.cache.fetch('movies')).not_to be_nil
      
      # Updating the last movie
      movie = Movie.last
      movie.title = "New Title"
      movie.save
      
      expect(Rails.cache.fetch('movies')).to be_nil
    end
  end

  context "When movie is destroyed" do 
    it "should flush the cache" do
      expect(subject).not_to be_nil
      expect(Rails.cache.fetch('movies')).not_to be_nil
      
      # Destroying the last movie
      movie = Movie.last.destroy
      
      expect(Rails.cache.fetch('movies')).to be_nil
    end
  end
end