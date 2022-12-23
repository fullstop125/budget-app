class CategoriesController < ApplicationController
  def create
    @category = Category.new(
      allowed_params
    )

    @category.user_id = current_user.id

    if @category.save
      save_cat_group(@category)
      redirect_to user_group_path(current_user.id, params[:group_id]), notice: 'Successfully created Category group'
    else
      render 'new', alert: 'Category group failed to create'
    end
  end

  def new
    @category = Category.all
  end

  private

  def save_cat_group(category)
    @category_group = CategoryGroup.create!(
      category_id: category.id,
      group_id: params[:group_id]
    )
  end

  def allowed_params
    params.require(:category).permit(:name, :amount)
  end
end
