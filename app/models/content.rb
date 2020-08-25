class Content < ActiveRecord::Base 
  belongs_to :feed
  before_save :delete_last
  validate :is_valid_body
  
  
  def delete_last
    Content.first.destroy if Content.where(feed_id: self.feed_id).count >= 10
  end
  
  private
  
  def is_valid_body
    begin
      true if Feedjira.parse(self.body)
    rescue StandardError => e
       errors.add(:parse, e)
    end
  end
end