require 'rails_helper'

RSpec.describe Operation, type: :model do
  before(:each) do
    @user = User.create(name: 'luis', email: 'example@email.com', password: 'password')
    @first_group = Group.create(name: 'Food', icon: 'icon.png', author_id: @user.id)
    @first_operation = Operation.create(name: 'pizza', amount: 12, author_id: @user.id)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@first_operation).to be_valid
    end

    it 'is not valid without a name' do
      @first_operation.name = nil
      expect(@first_operation).to_not be_valid
    end

    it 'is not valid without a amount' do
      @first_operation.amount = nil
      expect(@first_operation).to_not be_valid
    end
  end
end
