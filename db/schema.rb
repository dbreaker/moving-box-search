# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110425213626) do

  create_table "box_choices", :force => true do |t|
    t.integer  "move_size_id"
    t.integer  "used_card_board_box_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "move_sizes", :force => true do |t|
    t.string   "home_size"
    t.integer  "pounds"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.string   "aff_transaction_id"
    t.string   "aff_merchant_id"
    t.datetime "transaction_date"
    t.decimal  "transaction_amount"
    t.datetime "click_datetime"
    t.string   "aff_comment"
    t.string   "starbucks_amount_purchased"
    t.string   "starbucks_sent_to_email"
    t.string   "starbucks_confirmation_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "commission",                    :precision => 8, :scale => 2
    t.datetime "starbucks_sent_at"
  end

  add_index "purchases", ["aff_transaction_id"], :name => "index_purchases_on_aff_transaction_id"

  create_table "searches", :force => true do |t|
    t.date     "move_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location_string"
    t.string   "keyword"
    t.integer  "move_size_id"
    t.integer  "user_id"
  end

  create_table "used_card_board_box_products", :force => true do |t|
    t.string   "product_id"
    t.string   "name"
    t.string   "company_name"
    t.text     "link"
    t.string   "image_url"
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "merchant_id"
    t.text     "thumbnail_url"
    t.string   "instock_status"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                               :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
