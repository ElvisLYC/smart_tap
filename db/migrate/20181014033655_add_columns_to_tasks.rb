class AddColumnsToTasks < ActiveRecord::Migration[5.2]
  def change
  	remove_column :tasks, :from
    remove_column :tasks, :to

    add_column :tasks, :start_date, :date
    add_column :tasks, :start_time, :time
    add_column :tasks, :end_date, :date
    add_column :tasks, :end_time, :time

  end
end
