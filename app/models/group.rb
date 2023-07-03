class Group < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :group_operations, foreign_key: :group_id

  validates :name, presence: true
  validates :icon, presence: true

  def ordered_operations_desc
    # For a given group, the list of transactions is presented, ordered by the most recent.
    group_operations.where(user_id: user.id).order(created_at: :desc)
  end

  def total_amount
    g_operations = group_operations.where(group_id: id)
    g_operations.joins(:operation).sum(:amount)
  end
end
