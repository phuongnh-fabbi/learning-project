class Admin::UsersController < ApplicationController
  before_action :require_admin
  before_action :find_user, only:[:destroy, :edit, :update]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = t('controllers.update.success')
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "success"
    redirect_to admin_users_path
  end

  private 
    def find_user 
      @user = User.find_by(id: params[:id])
      content_not_found unless @user.present?
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
