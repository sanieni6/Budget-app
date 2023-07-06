require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'luis', email: 'example@email.com', password: 'password')
      @group = Group.create(name: 'group', icon: 'icon', author_id: @user.id)
      login_as(@user, scope: :user)
      get groups_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders a list of categories' do
      expect(response.body).to include('group')
    end
  end
end
