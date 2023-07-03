class CreateGroupOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :group_operations do |t|
      t.integer :group_id
      t.integer :operation_id
      t.timestamps
    end
  end
end
