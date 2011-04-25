class AddCommissionToPurchase < ActiveRecord::Migration
  def self.up
    add_column :purchases, :commission, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :purchases, :commission
  end
end