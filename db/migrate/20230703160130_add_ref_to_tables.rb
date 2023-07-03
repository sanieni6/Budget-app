class AddRefToTables < ActiveRecord::Migration[7.0]
  def change
    add_index :operations, :author_id
    add_index :groups, :author_id
    add_index :group_operations, :group_id
    add_index :group_operations, :operation_id
  end
end
