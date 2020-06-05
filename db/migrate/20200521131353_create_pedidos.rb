class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.string :nm_cliente
      t.integer :cliente_id
      t.float :vl_pedido
      t.string :status
      t.date :dt_prevista
      t.text :obs
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
