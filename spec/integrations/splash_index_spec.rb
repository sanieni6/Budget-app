require 'rails_helper'

RSpec.describe 'Integrations tests for splash view', type: :feature do
  before(:each) do
    @user = User.create(name: 'luis', email: 'example@email.com', password: 'password')
  end

  describe 'GET /index' do
    before do
      visit root_path
    end

    it 'should render the title of the page' do
      expect(page).to have_content('SmartWallet')
    end

    it 'should display a link to sign up' do
      expect(page).to have_link('Register', href: new_user_registration_path)
    end

    it 'should display a link to sign in' do
      expect(page).to have_link('Login', href: new_user_session_path)
    end
  end
end
