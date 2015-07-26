class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :url
      t.datetime :planned_start
      t.integer :duration
      t.text :notes

      t.timestamps null: false
    end
  end
end
