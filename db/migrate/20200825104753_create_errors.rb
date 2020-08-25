class CreateErrors < ActiveRecord::Migration[6.0]
  def change
    create_table :feed_errors do |t|
       t.belongs_to :feed
       
       t.string     :title
       t.json       :body
       t.timestamps
    end
  end
end
