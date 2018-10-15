class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.belongs_to :device
    	t.string :description
    	t.date :from
    	t.date :to
    	t.string :status
      t.timestamps
    end
  end
end
