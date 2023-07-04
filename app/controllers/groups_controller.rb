class GroupsController < ApplicationController
  # load_resource through: :current_user

  def index
    @groups = Group.where(author_id: current_user.id)
  end

  def show
    @group = Group.find(params[:id])
    @group_operations = GroupOperation.where(group_id: @group.id)
    @operations = @group_operations.map { |go| Operation.find(go.operation_id) }.sort_by(&:created_at).reverse
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(author_id: current_user.id, **group_params)
    if @group.save
      flash[:notice] = 'Category created successfully'
      redirect_to groups_path
    else
      flash[:alert] = 'Category not created'
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
