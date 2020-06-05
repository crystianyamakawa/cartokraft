class CreateClienteProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :cliente_produtos do |t|
      t.integer :cliente_id
      t.integer :produto_id
      t.integer :area
      t.integer :largura
      t.integer :comprimento
      t.integer :material_id
      t.text :obs
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
