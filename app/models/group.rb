class Group < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :group_operations, foreign_key: :group_id

  validates :name, presence: true
  validates :icon, presence: true
end
