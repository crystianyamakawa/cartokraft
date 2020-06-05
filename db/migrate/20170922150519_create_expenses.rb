class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :type
      t.references :partner, foreign_key: true
      t.decimal :amount_scheduled, :precision => 8, :scale => 2
      t.integer :status
      t.date :date_scheduled
      t.date :date_executed
      t.decimal :amount_executed, :precision => 8, :scale => 2
      t.text :obs

      t.timestamps
    end
  end
end
