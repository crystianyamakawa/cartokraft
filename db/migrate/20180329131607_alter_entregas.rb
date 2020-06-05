class AlterEntregas < ActiveRecord::Migration[5.0]
  def change
    add_column("entregas","dt_faturamento",:date, :after => "dt_entrega")
    add_column("entregas","recebimento_id",:integer, :after => "dt_faturamento")

  end
end
