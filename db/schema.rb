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

ActiveRecord::Schema.define(version: 20140428065645) do

  create_table "estadios", force: true do |t|
    t.string   "nombre"
    t.string   "ciudad"
    t.date     "fecha_construccion"
    t.integer  "capacidad"
    t.string   "foto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", force: true do |t|
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fases", force: true do |t|
    t.string   "fase"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.date     "fecha"
    t.integer  "fase_id"
    t.integer  "estado_id"
    t.integer  "local_id"
    t.integer  "visitante_id"
    t.string   "marcador"
    t.integer  "ganador_id"
    t.integer  "perdedor_id"
    t.string   "empate"
    t.integer  "group_id"
    t.integer  "estadio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participations", force: true do |t|
    t.integer  "team_id"
    t.integer  "group_id"
    t.integer  "puntos"
    t.integer  "pj"
    t.integer  "pg"
    t.integer  "pp"
    t.integer  "pe"
    t.integer  "gf"
    t.integer  "gc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "nombre"
    t.string   "entrenador"
    t.string   "bandera"
    t.string   "uniforme"
    t.text     "historia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
