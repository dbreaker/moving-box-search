class AddSentAtToPurchase < ActiveRecord::Migration
  def self.up
    add_column :purchases, :starbucks_sent_at, :datetime
  end

  def self.down
    remove_column :purchases, :sent_at
  end
end