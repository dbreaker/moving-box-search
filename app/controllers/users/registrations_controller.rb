class Users::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    build_resource
    if resource.save
      puts "INFO: checking search id"
      if session[:search_id]
        puts "INFO: found search id #{session[:search_id]}"
        search = Search.find(session[:search_id])
        resource.searches <<  search
      end
      resource.save!
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => redirect_location(resource_name, resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render_with_scope :new }
      #render new_user_registration_url
    end
  end
  
  protected

  def after_sign_up_path_for(resource)
    puts "INFO: checking search id"
    if session[:search_id]
      puts "INFO: redirecting to search"
      search = Search.find(session[:search_id])
      search_path(search)
    else
      puts "INFO: redirecting to account"
      url_for(:controller => '/accounts', :action => 'show', :id => resource.id)  #root_path
    end
  end
  
  # Overwrite redirect_for_sign_in so it takes uses after_sign_up_path_for.
  def redirect_location(scope, resource) #:nodoc:
    #stored_location_for(scope) || 
    after_sign_up_path_for(resource)
  end
  
  def respond_with_navigational(*args, &block)
    respond_with(*args) do |format|
      format.any(*navigational_formats, &block)
    end
  end
  
  def navigational_formats
    @navigational_formats ||= Devise.navigational_formats.select{ |format| Mime::EXTENSION_LOOKUP[format.to_s] }
  end

end