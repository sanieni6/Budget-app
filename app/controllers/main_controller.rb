class MainController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    return unless user_signed_in?
    # redirect_to groups_path
  end
end
