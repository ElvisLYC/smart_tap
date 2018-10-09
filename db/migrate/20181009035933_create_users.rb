class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.date :birthdate
      t.string :gender
      t.string :address
      t.string :city
      t.integer :zipcode
      t.integer :state
      t.string :country
      t.string :avatar
      t.integer :role, default: 0
      t.boolean :verification, default: false
      t.string :appliances
      t.string :play_lists

      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
