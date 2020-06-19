class CreateDespesas < ActiveRecord::Migration[5.0]
  def change
    create_table :despesas do |t|
      t.date :dt_fechamento
      t.string :nm_despesa
      t.string :tp_despesa
      t.date :dt_despesa
      t.float :vl_despesa

      t.timestamps
    end
  end
end
