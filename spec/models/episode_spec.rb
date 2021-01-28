require 'rails_helper'

RSpec.describe Episode do

  context "While creating a episode if season id is not provided" do
    
    subject { FactoryBot.create(:episode_without_season_id) }
    
    it "should raise an error sesson id must be provided" do 
      expect{ subject }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Season must exist, Season can't be blank")
    end
  end

  context "While creating a episode if serial_num is not provided" do
    
    subject { FactoryBot.create(:episode_without_serial_num) }
    
    it "should raise an error serial_num must be provided" do
      expect{ subject }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Serial num can't be blank")
    end
  end

  describe "seasons_with_episodes cache clear" do 
    before(:each) do
      Rails.cache.write("seasons_with_episodes", "Seasons With Episode are cached") 
    end
    
    context "When new Episode is created" do 
      it "should flush the seasons_with_episodes cache" do
       
        expect(Rails.cache.fetch('seasons_with_episodes')).not_to be_nil
        
        # Creating new episode
        FactoryBot.create(:random_episode)
        
        expect(Rails.cache.fetch('seasons_with_episodes')).to be_nil
      end
    end

    context "When Episode is Updated" do 
      it "should flush the seasons_with_episodes cache" do
        expect(subject).not_to be_nil
        expect(Rails.cache.fetch('seasons_with_episodes')).not_to be_nil
        
        FactoryBot.create(:random_episode)
        
        # Updating the last season
        episode = Episode.last
        episode.title = "New Title"
        episode.save
        
        expect(Rails.cache.fetch('seasons_with_episodes')).to be_nil
      end
    end

    context "When Episode is destroyed" do 
      it "should flush the seasons_with_episodes cachea" do
        expect(subject).not_to be_nil
        expect(Rails.cache.fetch('seasons_with_episodes')).not_to be_nil
        
        FactoryBot.create(:random_episode)

        # Destroying the last season
        Episode.last.destroy
        
        expect(Rails.cache.fetch('seasons_with_episodes')).to be_nil
      end
    end
  end
end