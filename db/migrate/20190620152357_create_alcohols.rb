class CreateAlcohols < ActiveRecord::Migration[5.1]
  def change
    create_table :alcohols do |t|
      t.string :name
      t.string :high_price
      t.string :low_price
      t.string :standard_price
      t.integer :weight
      t.string :quantity
      t.string :category

      t.timestamps
    end
  end
end
