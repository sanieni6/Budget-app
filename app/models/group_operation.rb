class GroupOperation < ApplicationRecord
  belongs_to :group, foreign_key: :group_id
  belongs_to :operation, foreign_key: :operation_id
end
