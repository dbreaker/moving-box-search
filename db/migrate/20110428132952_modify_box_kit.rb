class ModifyBoxKit < ActiveRecord::Migration
  def self.up
    add_column :box_choices, :moving_box_kit_id, :integer
    remove_column :box_choices, :used_card_board_box_product_id
  end

  def self.down
    remove_column :box_choices, :moving_box_kit_id
  end
end