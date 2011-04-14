class AddLocationToSearch < ActiveRecord::Migration
  def self.up
    add_column :searches, :location_string, :string
  end

  def self.down
    remove_column :searches, :location_string
  end
end