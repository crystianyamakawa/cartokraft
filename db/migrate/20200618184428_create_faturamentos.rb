class CreateFaturamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :faturamentos do |t|
      t.date :dt_fechamento
      t.float :vl_vendas
      t.float :vl_custo
      t.float :vl_bruto
      t.float :vl_despesa
      t.float :vl_liquido

      t.timestamps
    end
  end
end
