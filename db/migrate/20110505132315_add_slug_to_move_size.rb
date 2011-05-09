class AddSlugToMoveSize < ActiveRecord::Migration
  def self.up
    add_column :move_sizes, :slug, :string
    add_index :move_sizes, :slug
  end

  def self.down
    remove_index :move_sizes, :slug
    remove_column :move_sizes, :slug
  end
end