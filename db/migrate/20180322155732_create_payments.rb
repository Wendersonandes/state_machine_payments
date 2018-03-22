class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :product
      t.integer :amount
      t.string :state

      t.timestamps null: false
    end
  end
end
