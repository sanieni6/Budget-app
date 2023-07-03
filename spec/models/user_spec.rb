require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'luis', email: 'example@email.com', password: 'password')
    @first_group = Group.create(name: 'Food', icon: 'icon.png', author_id: @user.id)
    @first_operation = Operation.create(name: 'pizza', amount: 12, author_id: @user.id)
    @second_operation = Operation.create(name: 'cake', amount: 20, author_id: @user.id)
    @third_operation = Operation.create(name: 'taxi', amount: 10, author_id: @user.id)
    @fourth_operation = Operation.create(name: 'bus', amount: 5, author_id: @user.id)
    @fifth_operation = Operation.create(name: 'cinema', amount: 15, author_id: @user.id)
    @sixth_operation = Operation.create(name: 'theatre', amount: 30, author_id: @user.id)
    @first_group_operation = GroupOperation.create(group_id: @first_group.id, operation_id: @first_operation.id)
    @second_group_operation = GroupOperation.create(group_id: @first_group.id, operation_id: @second_operation.id)
    @third_group_operation = GroupOperation.create(group_id: @first_group.id, operation_id: @third_operation.id)
    @fourth_group_operation = GroupOperation.create(group_id: @first_group.id, operation_id: @fourth_operation.id)
    @fifth_group_operation = GroupOperation.create(group_id: @first_group.id, operation_id: @fifth_operation.id)
    @sixth_group_operation = GroupOperation.create(group_id: @first_group.id, operation_id: @sixth_operation.id)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'should be return the total amount of the group' do
      expect(@user.total_amount[0][:amount]).to eq(92)
    end
  end
end
