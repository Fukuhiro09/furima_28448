class CreateUserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
      t.string :postal_code,    default: "",  null: false
      t.integer :prefecture_id,                  null: false
      t.string :city,           default: ""
      t.string :house_number,   default: ""
      t.string :building_name,  default: ""
      t.string :phone_number,   default: ""
      t.references :purchase,               null: false,  foreign_key: true
      t.timestamps
    end
  end
end
