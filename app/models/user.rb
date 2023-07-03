class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, foreign_key: :author_id
  has_many :operations, foreign_key: :author_id

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def total_amount
    total = []
    groups.each do |group|
      g_operations = group.group_operations.where(group_id: group.id)
      amount = g_operations.joins(:operation).sum(:amount)
      total << { group:, amount: }
    end
    total
  end
end
