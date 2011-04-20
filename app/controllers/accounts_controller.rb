class AccountsController < ApplicationController

  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

end
