class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :high_price
      t.string :low_price
      t.string :normal_price
      t.string :quantity
      t.integer :weight
      t.string :category   

      t.timestamps
    end
  end
end
