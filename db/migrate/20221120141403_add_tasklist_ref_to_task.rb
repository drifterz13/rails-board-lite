class AddTasklistRefToTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :tasklist, foreign_key: true
  end
end
