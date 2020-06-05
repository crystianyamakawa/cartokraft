class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :name
      t.string :nr_localizador
      t.string :status
      t.integer :area
      t.integer :largura
      t.integer :comprimento
      t.string :tp_material
      t.integer :fornecedor_id
      t.text :obs
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
