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

ActiveRecord::Schema.define(version: 2019_02_23_071022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trashes", force: :cascade do |t|
    t.string "name"
    t.string "name_furi"
    t.integer "disposal_cost"
    t.boolean "disposable", default: true
    t.string "import_file"
    t.string "memo"
    t.date "updated_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end