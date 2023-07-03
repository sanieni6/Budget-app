class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, foreign_key: :author_id
  has_many :operations, foreign_key: :author_id

  validates :name, presence: true

  def totalAmount
    total = []
    mount = 0
    groups.each do |group|
      operations = group.group_operations.where(user_id: id)
      operations.each do |operation|
        mount += operation.amount
      end
      total << { group: group, amount: mount }
    end
    total
  end
end
