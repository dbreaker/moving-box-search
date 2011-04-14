class AddMoveSizeToSearch < ActiveRecord::Migration
  def self.up
    add_column :searches, :move_size_id, :integer
  end

  def self.down
    remove_column :searches, :move_size_id
  end
end