class AlteraDecimal < ActiveRecord::Migration[5.0]
  def change

    change_column :faturamentos, :vl_vendas, :decimal
    change_column :faturamentos, :vl_custo, :decimal
    change_column :faturamentos, :vl_bruto, :decimal
    change_column :faturamentos, :vl_despesa, :decimal
    change_column :faturamentos, :vl_liquido, :decimal
    change_column :despesas, :vl_despesa, :decimal

    add_column    :despesas, :obs, :string

  end
end
