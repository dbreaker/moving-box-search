class CreateClicks < ActiveRecord::Migration
  def self.up
    create_table :clicks do |t|
      t.integer :user_id
      t.integer :search_id
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :clicks
  end
end
