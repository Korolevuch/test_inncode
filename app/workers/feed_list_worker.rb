class FeedListWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform
    Feed.all.each do |feed|
      FeedSaveWorker.perform_async(feed.id)
    end
  end
end