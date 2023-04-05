class ImportsController < ApplicationController
  def create
    User.import_file(params[:file])
    redirect_to admin_users_path, notice: t("controllers.import.success")
  end
end
