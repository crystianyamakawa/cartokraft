class AlterEntregaItens < ActiveRecord::Migration[5.0]
  def change
    add_column("entrega_items","vl_custo",:float, :after => "vl_unitario")
  end
end
