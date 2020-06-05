class CreateEntregas < ActiveRecord::Migration[5.0]
  def change
    create_table :entregas do |t|
      t.integer :venda_id
      t.integer :cliente_id
      t.float :vl_total
      t.string :status
      t.date :dt_entrega
      t.text :obs
      t.string :nr_notafiscal
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
