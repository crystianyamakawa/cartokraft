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

ActiveRecord::Schema.define(version: 20200528143259) do

  create_table "cliente_produtos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "cliente_id"
    t.integer  "produto_id"
    t.integer  "area"
    t.integer  "largura"
    t.integer  "comprimento"
    t.integer  "material_id"
    t.text     "obs",         limit: 65535
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "clientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "nm_contato"
    t.string   "nr_telefone"
    t.string   "nr_celular"
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

  create_table "entrega_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "entrega_id"
    t.integer  "produto_id"
    t.float    "quantidade",  limit: 24
    t.float    "vl_unitario", limit: 24
    t.float    "vl_custo",    limit: 24
    t.float    "vl_total",    limit: 24
    t.string   "status"
    t.text     "obs",         limit: 65535
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "entregas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "cliente_id"
    t.float    "vl_total",       limit: 24
    t.integer  "status"
    t.date     "dt_entrega"
    t.date     "dt_faturamento"
    t.integer  "receipt_id"
    t.text     "obs",            limit: 65535
    t.string   "nr_notafiscal"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "expenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "type"
    t.integer  "partner_id"
    t.decimal  "amount_scheduled",               precision: 8, scale: 2
    t.integer  "status"
    t.date     "date_scheduled"
    t.date     "date_executed"
    t.decimal  "amount_executed",                precision: 8, scale: 2
    t.text     "obs",              limit: 65535
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.index ["partner_id"], name: "index_expenses_on_partner_id", using: :btree
  end

  create_table "fornecedors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
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
  end

  create_table "materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "nr_localizador"
    t.string   "status"
    t.integer  "area"
    t.integer  "largura"
    t.integer  "comprimento"
    t.float    "gramatura",      limit: 24
    t.float    "espessura",      limit: 24
    t.string   "tp_material"
    t.integer  "fornecedor_id"
    t.text     "obs",            limit: 65535
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "partners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "cell_phone"
    t.text     "obs",          limit: 65535
    t.string   "contact"
    t.string   "street"
    t.string   "number"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "postal"
    t.string   "state"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "pedido_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "pedido_id"
    t.string   "ds_produto"
    t.integer  "produto_id"
    t.float    "vl_largura",     limit: 24
    t.float    "vl_comprimento", limit: 24
    t.float    "vl_altura",      limit: 24
    t.string   "tp_papel"
    t.string   "tp_produto"
    t.float    "qt_pedido",      limit: 24
    t.float    "qt_produzido",   limit: 24
    t.float    "vl_custo",       limit: 24
    t.float    "vl_venda",       limit: 24
    t.float    "vl_total",       limit: 24
    t.string   "status"
    t.text     "obs",            limit: 65535
    t.date     "dt_prevista"
    t.date     "dt_entrega"
    t.date     "dt_produzido"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "pedidos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "nm_cliente"
    t.integer  "cliente_id"
    t.float    "vl_pedido",       limit: 24
    t.string   "status"
    t.date     "dt_prevista"
    t.text     "obs",             limit: 65535
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "ds_produto"
    t.integer  "produto_id"
    t.float    "vl_largura",      limit: 24
    t.float    "vl_comprimento",  limit: 24
    t.float    "vl_altura",       limit: 24
    t.string   "tp_papel"
    t.string   "tp_produto"
    t.integer  "qt_pedido"
    t.integer  "qt_produzido"
    t.float    "vl_custo",        limit: 24
    t.float    "vl_venda",        limit: 24
    t.float    "vl_total_pedido", limit: 24
    t.float    "vl_total_venda",  limit: 24
    t.date     "dt_entrega"
    t.integer  "entrega_id"
    t.date     "dt_produzido"
    t.date     "dt_fechamento"
  end

  create_table "produtos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "nr_localizador"
    t.string   "status"
    t.decimal  "area",                         precision: 10, scale: 4
    t.decimal  "largura",                      precision: 10, scale: 4
    t.decimal  "comprimento",                  precision: 10, scale: 4
    t.decimal  "altura",                       precision: 10, scale: 4
    t.decimal  "perda",                        precision: 10, scale: 4
    t.integer  "qt_chapa"
    t.string   "tp_material"
    t.integer  "fornecedor_id"
    t.integer  "cliente_id"
    t.integer  "material_id"
    t.decimal  "vl_venda",                     precision: 15, scale: 4
    t.decimal  "vl_custo",                     precision: 15, scale: 4
    t.text     "obs",            limit: 65535
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "receipts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "type"
    t.integer  "cliente_id"
    t.integer  "status"
    t.date     "date_scheduled"
    t.decimal  "amount_scheduled",               precision: 8, scale: 2
    t.date     "date_executed"
    t.decimal  "amount_executed",                precision: 8, scale: 2
    t.text     "obs",              limit: 65535
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.index ["cliente_id"], name: "index_receipts_on_cliente_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
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

  add_foreign_key "expenses", "partners"
  add_foreign_key "receipts", "clientes"
end
