class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.integer :user_id
      t.string :aff_transaction_id
      t.string :aff_merchant_id
      t.datetime :transaction_date
      t.decimal :transaction_amount
      t.datetime :click_datetime
      t.string :aff_comment
      t.string :starbucks_amount_purchased
      t.string :starbucks_sent_to_email
      t.string :starbucks_confirmation_number

      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
