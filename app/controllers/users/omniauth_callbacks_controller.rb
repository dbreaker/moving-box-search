class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model
    puts "INFO: checking search id"

    search = Search.find(session[:search_id]) if session[:search_id]
    @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user, search)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in @user, :event => :authentication
      if search
        redirect_to(search)
      else
        redirect_to :controller => '/accounts', :action => 'show', :id => @user.id
      end
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end