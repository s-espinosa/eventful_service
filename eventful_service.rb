require 'faraday'
require 'json'
require 'dotenv/load'

class EventfulService
  def initialize
    @conn = Faraday.new(url: "http://api.eventful.com/json/events/search") do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end

  def march_event_count
    march = {date: "March", location: 80202 }
    get_events(march)['total_items'].to_i
  end

  def most_popular
    popular = {location: "Los Angeles", sort_order: "popularity", page_size: 1}
    get_events(popular)['events']['event'].first["title"]
  end

  def erykah
    erykah = {keywords: "Erykah Badu", date: "2016010100-2016123100"}
    get_events(erykah)['total_items'].to_i
  end

  def least_popular(year)
    least_popular = {date: "#{year}010100-#{year}123100", sort_order: "popularity", sort_direction: 'ascending'}
    get_events(least_popular)['events']['event'].first['title']
  end

  def omaha_top_performer(year)
    top = {date: "#{year}010100-#{year}123100", location: "Omaha", sort_order: "popularity"}
    get_events(top)['events']['event'].first['performers']['performer']['name']
  end

  private

  def get_events(params)
    response = @conn.get do |req|
      req.params = params.merge(base_params)
    end.body
    JSON.parse(response)
  end

  def base_params
    {app_key: ENV["EVENTFUL_KEY"]}
  end
end
