class CreateConsumptions < ActiveRecord::Migration[5.2]
  def change
    create_table :consumptions do |t|
    	t.integer :power
    	t.string :price
    	t.boolean :switch_status , default:false
    	t.belongs_to :device
    	t.belongs_to :user

    	t.timestamps
    end
  end
end
