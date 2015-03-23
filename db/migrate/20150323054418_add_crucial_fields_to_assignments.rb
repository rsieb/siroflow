class AddCrucialFieldsToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :id_native, :string
    add_column :assignments, :closed, :boolean
    add_column :assignments, :prio_native, :float
    add_column :assignments, :parent_id_native, :string
  end
end
