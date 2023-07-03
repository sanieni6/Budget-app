class GroupsController < ApplicationController
  load_resource through: :current_user

  def index
    @groups = Group.all
  end
end
