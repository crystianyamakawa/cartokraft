class CreateEntregaItems < ActiveRecord::Migration[5.0]
  def change
    create_table :entrega_items do |t|
      t.integer :entrega_id
      t.integer :produto_id
      t.float :quantidade
      t.float :vl_unitario
      t.float :vl_total
      t.string :status
      t.text :obs
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
