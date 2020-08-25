class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.belongs_to :feed
      t.json       :body
    end
  end
end
