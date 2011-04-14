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

ActiveRecord::Schema.define(:version => 20110408051740) do

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

  create_table "searches", :force => true do |t|
    t.date     "move_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location_string"
    t.string   "keyword"
    t.integer  "move_size_id"
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

end
