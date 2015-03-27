class AddNativeUpdatedToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :updated_at_native, :datetime
  end
end
