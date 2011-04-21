class AdminController < ApplicationController

  before_filter :authenticate_user!
  before_filter :authenticate_admin, :except => [:login_as_admin]
  
  layout "admin"

  def view_users
  end

  def index
    @users = User.all
  end
  
  def login_as_admin
      #return unless current_user.is_an_admin?
      admin = User.find(session[:admin_id])
      sign_in(:user, admin)
      session[:admin_id] = nil
      redirect_to :action => 'index'
  end

  def login_as
      #return unless current_user.is_an_admin?
      user = User.find(params[:id])
      session[:admin_id] = current_user.id
      sign_in(:user, user)
      redirect_to :controller => 'accounts', :action => 'show', :id => user.id
  end

  private
  def authenticate_admin
    if !current_user.admin?
      render :text => "Oops, you need to be an admin to view this page."
    end
  end

end
