class CreateMovingBoxKits < ActiveRecord::Migration
  def self.up
    create_table :moving_box_kits do |t|
      t.string :product_id
      t.string :name
      t.string :link
      t.string :image_url
      t.decimal :price, :precision => 8, :scale => 2
      t.text :description
      t.text :thumbnail_url
      t.string :merchant_id
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :moving_box_kits
  end
end
