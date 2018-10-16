class AddColumnDevice < ActiveRecord::Migration[5.2]
  def change
    add_column :devices, :name, :string    
  end
end
