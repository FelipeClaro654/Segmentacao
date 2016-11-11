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

ActiveRecord::Schema.define(version: 20161110232320) do

  create_table "contatos", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.integer  "idade"
    t.integer  "estado_id"
    t.string   "cargo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_contatos_on_estado_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historico_segmentacaos", force: :cascade do |t|
    t.string   "nome"
    t.string   "tipo_nome"
    t.string   "clause_nome"
    t.string   "email"
    t.string   "tipo_email"
    t.string   "clause_email"
    t.integer  "idade"
    t.string   "tipo_idade"
    t.string   "clause_idade"
    t.string   "cargo"
    t.string   "tipo_cargo"
    t.string   "clause_cargo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "estado_id"
    t.index ["estado_id"], name: "index_historico_segmentacaos_on_estado_id"
  end

end
