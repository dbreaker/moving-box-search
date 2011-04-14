class CreateBoxChoices < ActiveRecord::Migration
  def self.up
    create_table :box_choices do |t|
      t.integer :move_size_id
      t.integer :used_card_board_box_product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :box_choices
  end
end
