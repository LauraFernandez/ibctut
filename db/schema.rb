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

ActiveRecord::Schema.define(:version => 20100818124600) do

  create_table "_users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "_users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "comments", :force => true do |t|
    t.string   "author",           :limit => 50,  :default => ""
    t.string   "email",            :limit => 100, :default => ""
    t.string   "website",          :limit => 100, :default => ""
    t.text     "body",                            :default => ""
    t.datetime "created_at",                                      :null => false
    t.integer  "commentable_id",                  :default => 0,  :null => false
    t.string   "commentable_type", :limit => 15,  :default => "", :null => false
    t.integer  "user_id",                         :default => 0,  :null => false
  end

  add_index "comments", ["user_id"], :name => "fk_comments_user"

  create_table "dogs", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "talk_id"
  end

  create_table "speakers", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "talk_id"
  end

  create_table "talk_speakers", :force => true do |t|
    t.integer "speaker_id"
    t.integer "talk_id"
  end

  create_table "talks", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.integer  "room_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

end
