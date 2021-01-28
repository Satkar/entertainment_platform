require 'rails_helper'

RSpec.describe Season do

  before do 
    Rails.cache.delete('seasons_with_episodes')
    FactoryBot.create_list(:random_season, 10)
  end

  subject(:seasons) { Season.fetch_and_cache }

  describe ".fetch_and_cache" do  
    context "when data is not cached" do 
      it "returns nil for the cache key seasons_with_episodes" do 
        expect(Rails.cache.fetch('seasons_with_episodes')).to eq(nil)
      end
    end

    context "when data is cached" do 
      it "should not return nil for the cache key seasons with episodes" do 
        expect(subject).not_to be_nil
        expect(Rails.cache.fetch('seasons_with_episodes')).not_to be_nil
      end
    end
  end

  context "When new Season is created" do 
    it "should flush the cache and fetch latest data" do
      expect(subject).not_to be_nil
      expect(Rails.cache.fetch('seasons_with_episodes')).not_to be_nil
      
      # Creating new season
      Season.create(FactoryBot.attributes_for :random_season)
      
      expect(Rails.cache.fetch('seasons_with_episodes')).to be_nil
    end
  end

  context "When Season is Updated" do 
    it "should flush the cache and fetch latest data" do
      expect(subject).not_to be_nil
      expect(Rails.cache.fetch('seasons_with_episodes')).not_to be_nil
      
      # Updating the last season
      season = Season.last
      season.title = "New Title"
      season.save
      
      expect(Rails.cache.fetch('seasons_with_episodes')).to be_nil
    end
  end

  context "When Season is destroyed" do 
    it "should flush the cache and fetch latest data" do
      expect(subject).not_to be_nil
      expect(Rails.cache.fetch('seasons_with_episodes')).not_to be_nil
      
      # Destroying the last season
      Season.last.destroy
      
      expect(Rails.cache.fetch('seasons_with_episodes')).to be_nil
    end
  end
end