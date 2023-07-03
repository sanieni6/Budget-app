class Operation < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :group_operations, foreign_key: :operation_id

  validates :name, presence: true
  validates :amount, presence: true
end
