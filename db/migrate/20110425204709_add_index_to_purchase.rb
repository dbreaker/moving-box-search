class AddIndexToPurchase < ActiveRecord::Migration
  def self.up
    add_index :purchases, :aff_transaction_id
  end

  def self.down
    remove_index :purchases, :aff_transaction_id
  end
end