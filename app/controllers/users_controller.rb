class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @groups = Group.where(user_id: params[:id])
  end

  def index; end
end
