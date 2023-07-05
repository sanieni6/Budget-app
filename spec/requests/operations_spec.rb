require 'rails_helper'

RSpec.describe 'Operations', type: :request do
  include Devise::Test::IntegrationHelpers
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'luis', email: 'example@email.com', password: 'password')
      @group = Group.create(name: 'group', icon: 'icon', author_id: @user.id)
      @first_operation = Operation.create(name: 'pizza', amount: 12, author_id: @user.id)
      @first_group_operation = GroupOperation.create(group_id: @group.id, operation_id: @first_operation.id)
      login_as(@user, scope: :user)
      get group_path(@group.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders a list of operations' do
      expect(response.body).to include('pizza')
    end
  end
end
