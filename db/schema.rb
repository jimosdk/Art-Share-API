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

ActiveRecord::Schema.define(version: 2021_07_23_095356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artwork_shares", force: :cascade do |t|
    t.integer "viewer_id", null: false
    t.integer "artwork_id", null: false
    t.boolean "favorite", default: false, null: false
    t.index ["artwork_id", "viewer_id"], name: "index_artwork_shares_on_artwork_id_and_viewer_id", unique: true
    t.index ["viewer_id"], name: "index_artwork_shares_on_viewer_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.string "title", null: false
    t.string "image_url", null: false
    t.integer "artist_id", null: false
    t.boolean "favorite", default: false, null: false
    t.index ["artist_id", "title"], name: "index_artworks_on_artist_id_and_title", unique: true
  end

  create_table "collections", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.string "title", null: false
    t.index ["owner_id"], name: "index_collections_on_owner_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commenter_id", null: false
    t.integer "artwork_id", null: false
    t.text "body", null: false
    t.index ["artwork_id"], name: "index_comments_on_artwork_id"
    t.index ["commenter_id"], name: "index_comments_on_commenter_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "liker_id", null: false
    t.integer "likeable_id", null: false
    t.string "likeable_type", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["liker_id", "likeable_type", "likeable_id"], name: "index_likes_on_liker_id_and_likeable_type_and_likeable_id", unique: true
  end

  create_table "saved_artworks", force: :cascade do |t|
    t.integer "artwork_id", null: false
    t.integer "collection_id", null: false
    t.index ["artwork_id"], name: "index_saved_artworks_on_artwork_id"
    t.index ["collection_id", "artwork_id"], name: "index_saved_artworks_on_collection_id_and_artwork_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
