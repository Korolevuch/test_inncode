class FeedSaveWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(id) 
    feed = Feed.find(id)
    begin
      parse_url(feed)
    rescue StandardError => e
      FeedError.new(title: "Feed error", feed_id: feed.id, body: "#{e.backtrace.join('n')}")
      feed.update(is_active: false)
    end
  end
    
  private 
    
  def parse_url(feed)
    xml = Faraday.get(feed.link, {'Accept' => 'application/json'}).body
    Content.create(feed_id: feed.id, body: xml.force_encoding('UTF-8'))
    
    feed.error.destroy_all
  end
end