class RemoveTaskFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :task, :string
  end
end
