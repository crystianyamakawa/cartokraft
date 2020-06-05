class AlterRecebimentos < ActiveRecord::Migration[5.0]
  def change
    add_column("recebimentos","entrega_id",:integer, :after => "cliente_id")

  end
end
