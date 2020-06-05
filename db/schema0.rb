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

ActiveRecord::Schema.define(version: 20170621185041) do

  create_table "clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "nr_telefone"
    t.string   "nr_telefone2"
    t.date     "dt_nascimento"
    t.string   "nr_documento"
    t.string   "tp_documento"
    t.string   "nr_cpf_cnpj"
    t.string   "rua"
    t.string   "complemento"
    t.string   "numero"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.string   "cep"
    t.text     "obs",           limit: 65535
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "contrato_produtos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contrato_id"
    t.integer  "produto_id"
    t.integer  "quantidade"
    t.float    "vl_tabela",    limit: 24
    t.float    "vl_negociado", limit: 24
    t.datetime "dt_inicio"
    t.datetime "dt_termino"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["contrato_id", "produto_id"], name: "index_contrato_produtos_on_contrato_id_and_produto_id", using: :btree
  end

  create_table "contratos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "cliente_id"
    t.string   "tp_evento"
    t.date     "dt_evento"
    t.datetime "dt_inicio"
    t.datetime "dt_termino"
    t.string   "status"
    t.decimal  "vl_negociado",               precision: 15, scale: 2
    t.string   "vl_extenso"
    t.text     "obs",          limit: 65535
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["cliente_id"], name: "index_contratos_on_cliente_id", using: :btree
  end

  create_table "despesas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "tp_despesa"
    t.integer  "contrato_id"
    t.integer  "fornecedor_id"
    t.decimal  "vl_despesa",                  precision: 15, scale: 2
    t.string   "status"
    t.date     "dt_executado"
    t.float    "vl_executado",  limit: 24
    t.text     "obs",           limit: 65535
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "eventos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "dt_evento"
    t.datetime "dt_inicio"
    t.datetime "dt_termino"
    t.string   "created_by"
    t.string   "update_by"
    t.text     "obs",         limit: 65535
    t.string   "tp_evento"
    t.string   "status"
    t.integer  "sinc_google"
    t.datetime "dt_sinc"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "fechamento_caixas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "periodo"
    t.integer  "fin_conta_id"
    t.decimal  "vl_saldo",     precision: 15, scale: 2
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "fin_conta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "banco"
    t.string   "agencia"
    t.string   "conta"
    t.decimal  "saldo",                    precision: 15, scale: 2
    t.string   "status"
    t.text     "obs",        limit: 65535
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "fin_movimentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tp_movimento"
    t.string   "name"
    t.decimal  "valor",                       precision: 15, scale: 2
    t.string   "status"
    t.string   "motivo_status"
    t.date     "dt_previsto"
    t.string   "dt_executado"
    t.integer  "contrato_id"
    t.integer  "fin_conta_id"
    t.integer  "despesa_id"
    t.text     "obs",           limit: 65535
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.index ["contrato_id"], name: "index_fin_movimentos_on_contrato_id", using: :btree
    t.index ["despesa_id"], name: "index_fin_movimentos_on_despesa_id", using: :btree
  end

  create_table "fornecedors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "nr_telefone"
    t.string   "nr_telefone2"
    t.text     "obs",          limit: 65535
    t.string   "contato"
    t.string   "rua"
    t.string   "nr_endereco"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "cep"
    t.string   "uf"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  endschema0
    t.float    "valor",      limit: 24
    t.text     "obs",        limit: 65535
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
