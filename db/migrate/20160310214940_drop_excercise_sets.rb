class DropExcerciseSets < ActiveRecord::Migration
  def up
    drop_table :exercises
  end
end
