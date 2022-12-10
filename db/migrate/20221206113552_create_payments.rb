class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :order,    null: false, foreign_key: true
      t.string :post_code,    null: false
      t.integer :area_id,     null: false
      t.string :city,         null: false
      t.string :address,      null: false
      t.string :building
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
