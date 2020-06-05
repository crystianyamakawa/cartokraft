class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :phone
      t.string :cell_phone
      t.text :obs
      t.string :contact
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :postal
      t.string :state

      t.timestamps
    end
  end
end
