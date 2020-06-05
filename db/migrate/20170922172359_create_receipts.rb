class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.string :name
      t.integer :type
      t.references :cliente, foreign_key: true
      t.integer :status
      t.date :date_scheduled
      t.decimal :amount_scheduled , :precision => 8, :scale => 2
      t.date :date_executed
      t.decimal :amount_executed,  :precision => 8, :scale => 2
      t.text :obs
      t.timestamps
    end
  end
end
