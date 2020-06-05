class CreatePedidoItems < ActiveRecord::Migration[5.0]
  def change
    create_table :pedido_items do |t|
      t.integer :pedido_id
      t.string :ds_produto
      t.integer :produto_id
      t.float :vl_largura
      t.float :vl_comprimento
      t.float :vl_altura
      t.string :tp_papel
      t.string :tp_produto
      t.float :qt_pedido
      t.float :qt_produzido
      t.float :vl_custo
      t.float :vl_venda
      t.float :vl_total
      t.string :status
      t.text :obs
      t.date :dt_prevista
      t.date :dt_entrega
      t.date :dt_produzido
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
