class AddTempFieldsToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :status, :string
    add_column :assignments, :context, :string
  end
end
