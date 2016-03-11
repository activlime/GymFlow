class AddNewColumnToExercise < ActiveRecord::Migration
  def up
    add_column :exercises, :reps, :integer
  end
end
