class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      t.date :birthdate, null: false
      t.string :gender, null: false
      t.string :address, null: false
      t.string :email, null: false
      t.string :city, null: false
      t.integer :zipcode, null: false
      t.integer :state, null: false
      t.string :country, null: false
      t.string :avatar
      t.string :role, default: 0
      t.string :verification, default: false
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
