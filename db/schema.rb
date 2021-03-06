# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110101201840) do

  create_table "calorie_intakes", :force => true do |t|
    t.string   "ci_type"
    t.datetime "date"
    t.string   "description"
    t.float    "calorie_intake"
    t.integer  "user_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "trainings", :force => true do |t|
    t.string   "training_type"
    t.datetime "training_date"
    t.string   "description"
    t.integer  "duration"
    t.integer  "user_id"
    t.integer  "calories"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  create_table "weights", :force => true do |t|
    t.datetime "weighting_date"
    t.integer  "user_id"
    t.decimal  "weight",         :precision => 8, :scale => 2, :null => false
  end

end
