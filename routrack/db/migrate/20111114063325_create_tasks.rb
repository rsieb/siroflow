class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.float :target_duration

      t.timestamps
    end
  end
end
