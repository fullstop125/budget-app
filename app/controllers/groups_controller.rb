class GroupsController < ApplicationController
  def create
    @group = Group.new(
      allowed_params
    )

    @group.user_id = current_user.id

    if @group.save
      redirect_to user_path(current_user.id), notice: 'Group created successfully'
    else
      render 'new', alert: 'Group was not created'
    end
  end

  def show
    # Group id
    @groups = Group.where(user_id: current_user.id)
    @category_groups = CategoryGroup.all.order(created_at: :desc)
  end

  def new
    @groups = Group.all
  end

  private

  def allowed_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
