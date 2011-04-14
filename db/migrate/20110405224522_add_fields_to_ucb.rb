class AddFieldsToUcb < ActiveRecord::Migration
  def self.up
    add_column :used_card_board_box_products, :merchant_id, :string
    add_column :used_card_board_box_products, :thumbnail_url, :text
    add_column :used_card_board_box_products, :instock_status, :string
  end

  def self.down
    remove_column :used_card_board_box_products, :instock_status
    remove_column :used_card_board_box_products, :thumbnail_url
    remove_column :used_card_board_box_products, :merchant_id
  end
end
