# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_16_122105) do
  create_table "cinemas", force: :cascade do |t|
    t.string "name"
    t.string "cinema_hall_count"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cinemas_movies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cinema_id"
    t.integer "movie_id"
    t.index ["cinema_id"], name: "index_cinemas_movies_on_cinema_id"
    t.index ["movie_id"], name: "index_cinemas_movies_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "movie_id"
    t.string "viewers_count"
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "price"
    t.datetime "date"
    t.index ["movie_id"], name: "index_sessions_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "viewers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "booking"
    t.boolean "bought"
    t.index ["session_id"], name: "index_viewers_on_session_id"
    t.index ["user_id"], name: "index_viewers_on_user_id"
  end

end
