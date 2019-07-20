class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :mobile_number
      t.string :email
      t.string :comments
      t.integer :total_price
      t.boolean :review

      t.timestamps
    end
  end
end
