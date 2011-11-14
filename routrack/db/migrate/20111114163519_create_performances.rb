class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|

      t.timestamps
    end
  end
end
