class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def authenticate_admin
    if !current_user.admin?
      render :text => "Oops, you need to be an admin to view this page."
    else
      true
    end
  end

end
