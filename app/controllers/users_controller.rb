class UsersController < ApplicationController
  def show
    @new_book = Book.new
    @user = User.find(params[:id])
  end

  def index
    @new_book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
