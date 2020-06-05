class AlterProduto < ActiveRecord::Migration[5.0]
  def change
    add_column("produtos","cliente_id",:integer, :after => "fornecedor_id")
    add_column("produtos","material_id",:integer, :after => "cliente_id")
    add_column("produtos","vl_venda",:float, :after => "material_id")
    add_column("produtos","vl_custo",:float, :after => "vl_venda")

  end
end
