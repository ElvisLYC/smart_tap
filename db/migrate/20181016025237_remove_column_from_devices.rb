class RemoveColumnFromDevices < ActiveRecord::Migration[5.2]
  def change
  	remove_column :devices, :subscription_id
  end
end
