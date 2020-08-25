class Feed < ActiveRecord::Base 
  has_many :feed_errors
  has_many :contents
end