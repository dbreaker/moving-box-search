class CreateUsedCardBoardBoxProducts < ActiveRecord::Migration
  def self.up
    create_table :used_card_board_box_products do |t|
      t.string :product_id
      t.string :name
      t.string :company_name
      t.text :link
      t.string :image_url
      t.decimal :price, :precision => 8, :scale => 2
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :used_card_board_box_products
  end
end
