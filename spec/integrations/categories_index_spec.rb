require 'rails_helper'

RSpec.describe 'Integrations tests for categories', type: :feature do
  before(:each) do
    @user = User.create(name: 'luis', email: 'example@email.com', password: 'password')
    @group = Group.create(name: 'group',
                          icon: 'https://img.uxwing.com/wp-content/themes/uxwing/download/food-drinks-cooking/meal-food-icon.png',
                          author_id: @user.id)
    @operation = Operation.create(name: 'pizza', amount: 12, author_id: @user.id)
    @group_operation = GroupOperation.create(group_id: @group.id, operation_id: @operation.id)
  end

  describe 'GET /index' do
    before do
      login_as(@user, scope: :user)
      visit groups_path
    end

    it 'should render the title of the page' do
      expect(page).to have_content('Categories')
    end

    it 'should render the name of the group' do
      expect(page).to have_content('group')
    end

    it 'should display a link to create a new category' do
      expect(page).to have_link('New Category', href: new_group_path)
    end

    it 'should redirect to show page when click on the group name' do
      click_link 'group'
      expect(page).to have_content('pizza')
    end
  end
end
