class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.string     :link, unique: true
      t.boolean    :is_active
      
      t.timestamps 
    end
  end
end
