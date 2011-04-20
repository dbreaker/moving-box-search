class DashboardController < ApplicationController

  before_filter :authenticate_admin!
  layout "admin"

  def view_users
  end

  def index
    @users = User.all
  end
  
  def login_as_admin
      #return unless current_user.is_an_admin?
      admin = Admin.find(params[:id])
      sign_in(:admin, admin)
      session[:admin_id] = nil
      redirect_to :action => 'index'
  end

  def login_as
      #return unless current_user.is_an_admin?
      user = User.find(params[:id])
      sign_in(:user, user)
      session[:admin_id] = current_admin.id
      redirect_to :controller => 'accounts', :action => 'show', :id => user.id
  end

end
