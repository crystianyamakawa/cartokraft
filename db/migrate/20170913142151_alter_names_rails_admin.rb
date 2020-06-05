class AlterNamesRailsAdmin < ActiveRecord::Migration[5.0]
  def change
    rename_column("clientes","nome","name")
    rename_column("compras","descricao","name")
    rename_column("despesas","nome","name")
    rename_column("fin_conta","descricao","name")
    rename_column("fin_movimentos","descricao","name")
    rename_column("fornecedors","nome","name")
    rename_column("materials","descricao","name")
    rename_column("produtos","descricao","name")
    rename_column("recebimentos","nome","name")
    rename_column("vendas","descricao","name")
  end
end
