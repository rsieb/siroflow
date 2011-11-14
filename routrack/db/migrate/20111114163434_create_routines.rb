class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|

      t.timestamps
    end
  end
end
