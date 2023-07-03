class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :operations, :users, column: :author_id
    add_foreign_key :groups, :users, column: :author_id
    add_foreign_key :group_operations, :groups
    add_foreign_key :group_operations, :operations
  end
end
