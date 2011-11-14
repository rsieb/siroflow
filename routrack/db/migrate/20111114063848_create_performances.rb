class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.float :actual_duration

      t.timestamps
    end
  end
end
