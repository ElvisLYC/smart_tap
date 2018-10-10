class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
    	t.boolean :payment_verification, default: false
    	t.belongs_to :user
    	t.belongs_to :subscription

    	t.timestamps
    end
  end
end
