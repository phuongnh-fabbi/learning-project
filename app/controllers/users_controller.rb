class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    if current_user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    if params[:user][:password].blank?
      params.require(:user).permit(:name, :email)
    else
      params.require(:user).permit(:name, :email, :password)
    end
  end
end
