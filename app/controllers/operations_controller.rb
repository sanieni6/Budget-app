class OperationsController < ApplicationController
  def new
    @operation = Operation.new
    @group = Group.find(params[:group_id])
  end

  def create
    @operation = Operation.new(author_id: current_user.id, name: params[:operation][:name],
                               amount: params[:operation][:amount])
    if @operation.save
      @group_operation = GroupOperation.new(group_id: params[:operation][:group_id], operation_id: @operation.id)
      if @group_operation.save
        flash[:notice] = 'Operation created successfully'
        redirect_to group_path(params[:operation][:group_id])
      else
        flash[:alert] = 'Operation not created'
        render :new
      end
    else
      flash[:alert] = 'Operation not created'
      render :new
    end
  end
end
