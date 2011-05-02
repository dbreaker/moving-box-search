class AddLogoAndDescToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :logo_file, :string
    add_column :companies, :about, :text
  end

  def self.down
    remove_column :companies, :about
    remove_column :companies, :logo_file
  end
end