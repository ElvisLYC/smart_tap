class AddColumnsToTasks < ActiveRecord::Migration[5.2]
  def change
  	remove_column :tasks, :from
    remove_column :tasks, :to

    add_column :tasks, :start_date, :datetime
    add_column :tasks, :start_time, :datetime
    add_column :tasks, :end_date, :datetime
    add_column :tasks, :end_time, :datetime

  end
end
