class AlterFinMovimentos < ActiveRecord::Migration[5.0]
  def change
    add_column("fin_movimentos","despesa_id",:integer, :after => "fin_conta_id")
    add_column("fin_movimentos","receita_id",:integer, :after => "despesa_id")

  end
end
