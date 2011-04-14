class AddKeywordToSearch < ActiveRecord::Migration
  def self.up
    add_column :searches, :keyword, :string
  end

  def self.down
    remove_column :searches, :keyword
  end
end