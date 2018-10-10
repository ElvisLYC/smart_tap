class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
    	t.integer :purchase_unit
    	t.integer :balance_unit
    	t.integer :price
    	t.belongs_to :user

    	t.timestamps
    end
  end
end
