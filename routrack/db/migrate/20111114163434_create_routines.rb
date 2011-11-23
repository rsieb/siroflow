class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.string :string
      
      t.timestamps
    end
  end
end
