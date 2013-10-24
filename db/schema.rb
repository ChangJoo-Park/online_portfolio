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

ActiveRecord::Schema.define(version: 20131004110415) do

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "work_for"
    t.string   "types"
    t.string   "layouts"
    t.boolean  "visibility"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumbnail_url"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.integer  "position"
  end

  create_table "sub_images", force: true do |t|
    t.string   "caption"
    t.boolean  "selected"
    t.integer  "order"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "position"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "sub_images", ["project_id"], name: "index_sub_images_on_project_id"

end
