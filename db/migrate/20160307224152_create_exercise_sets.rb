class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|
      t.integer :reps

      t.timestamps null: false
    end
  end
end
