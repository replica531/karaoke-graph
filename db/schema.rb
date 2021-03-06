# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_528_100_620) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'musics', force: :cascade do |t|
    t.string 'title'
    t.string 'artist'
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.text 'memo'
    t.integer 'key', default: 0, null: false
    t.boolean 'favorite', default: false, null: false
    t.index ['user_id'], name: 'index_musics_on_user_id'
  end

  create_table 'results', force: :cascade do |t|
    t.float 'score'
    t.text 'memo'
    t.datetime 'datetime'
    t.bigint 'music_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'user_id', null: false
    t.string 'model', default: 'その他', null: false
    t.integer 'key', default: 0, null: false
    t.index ['music_id'], name: 'index_results_on_music_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'password_digest'
    t.string 'remember_digest'
    t.boolean 'admin', default: false
    t.string 'activation_digest'
    t.boolean 'activated', default: false
    t.datetime 'activated_at'
    t.string 'reset_digest'
    t.datetime 'reset_sent_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'results', 'musics'
end
