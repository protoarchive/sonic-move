# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160101065137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "portrait"
    t.string   "zipcode"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "spotify"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "artists", ["user_id"], name: "index_artists_on_user_id", using: :btree

  create_table "playlist_songs", force: :cascade do |t|
    t.integer  "playlist_id"
    t.integer  "song_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "playlist_songs", ["playlist_id"], name: "index_playlist_songs_on_playlist_id", using: :btree
  add_index "playlist_songs", ["song_id"], name: "index_playlist_songs_on_song_id", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "artist"
    t.string   "album"
    t.string   "echonest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "auth_token"
  end

  add_foreign_key "artists", "users"
  add_foreign_key "playlist_songs", "playlists"
  add_foreign_key "playlist_songs", "songs"
end
