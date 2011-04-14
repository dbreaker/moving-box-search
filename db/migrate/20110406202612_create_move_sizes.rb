class CreateMoveSizes < ActiveRecord::Migration
  def self.up
    create_table :move_sizes do |t|
      t.string :home_size
      t.integer :pounds

      t.timestamps
    end


  end

  def self.down
    drop_table :move_sizes
  end
end
