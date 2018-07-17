class AdduserToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :user, :references
  end
end
