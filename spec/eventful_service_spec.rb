require 'rspec'
require_relative '../eventful_service'

describe EventfulService do
  describe "#march_event_count" do
    it 'returns the number of events in March of 2017 in zip code 80202' do
      result = EventfulService.new.march_event_count

      expect(result).to eq(288)
    end
  end

  describe '#most_popular' do
    it 'returns the most popular event in March of 2017 in Los Angeles' do
      result = EventfulService.new.most_popular

      expect(result).to eq("Lil Wayne - Kloser 2 U Tour")
    end
  end

  describe '#erykah_count' do
    it 'returns the number of events with Erykah Badu in 2016' do
      result = EventfulService.new.erykah

      expect(result).to eq(187)
    end
  end

  describe '#least_popular' do
    it 'returns the least popular event for a year' do
      result = EventfulService.new.least_popular(2016)

      expect(result).to eq("Mindfulness Retreat")
    end
  end

  describe '#omaha_top_performer' do
    it 'returns the first performer for the most popular event in Omaha' do
      result = EventfulService.new.omaha_top_performer(2016)

      expect(result).to eq("Willie Nelson")
    end
  end
end
