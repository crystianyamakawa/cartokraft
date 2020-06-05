class AddItemToPedido < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :ds_produto, :string
    add_column :pedidos, :produto_id, :integer
    add_column :pedidos, :vl_largura, :float
    add_column :pedidos, :vl_comprimento, :float
    add_column :pedidos, :vl_altura, :float
    add_column :pedidos, :tp_papel, :string
    add_column :pedidos, :tp_produto, :string
    add_column :pedidos, :qt_pedido, :integer
    add_column :pedidos, :qt_produzido, :integer
    add_column :pedidos, :vl_custo, :float
    add_column :pedidos, :vl_venda, :float
    add_column :pedidos, :vl_total_pedido, :float
    add_column :pedidos, :vl_total_venda, :float
    add_column :pedidos, :dt_entrega, :date
    add_column :pedidos, :entrega_id, :integer
    add_column :pedidos, :dt_produzido, :date
    add_column :pedidos, :dt_fechamento, :date
  end
end
