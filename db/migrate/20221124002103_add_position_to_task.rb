class AddPositionToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :position, :integer
    Tasklist.all.each do |tasklist|
      tasklist.tasks.order(:updated_at).each.with_index(1) do |task, index|
        task.update :position, index
      end
    end
  end
end
