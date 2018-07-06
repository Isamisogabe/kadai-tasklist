class AddHelloToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :hello, :string
  end
end
