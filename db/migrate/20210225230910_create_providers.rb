class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :buyer
      t.string :descriçao
      t.float :unit_price
      t.integer :quantity
      t.string :address
      t.string :supplier

      t.timestamps
    end
  end
end
