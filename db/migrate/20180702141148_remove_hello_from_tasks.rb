class RemoveHelloFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :hello, :string
  end
end
