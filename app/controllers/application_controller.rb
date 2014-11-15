class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # OSCAR - Turning off security to make development easier
  #protect_from_forgery with: :exception
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

	# CanCan Gem messing up CRUD with Rails 4, workaround
	before_filter do
	  resource = controller_name.singularize.to_sym
		method = "#{resource}_params"
		params[resource] &&= send(method) if respond_to?(method, true)
	end

	# Change CanCan AccessDenied page
	#rescue_from CanCan::AccessDenied do |exception|
	#	redirect_to root_url, alert: exception.message
	#end

  private

  def after_sign_in_path_for(resource_or_scope)
    root_url
  end

  def authenticate_user_from_token!
    puts "authenticating user"
    # No token in query string so just return
    if !params[:token].presence
      return
    end

    user_email = params[:email].presence
    user = user_email && User.find_by_email(user_email)
    if user
      #Check if token expired
      if user.expire_date < DateTime.now
        render :json => { alert: 'Expired Token'}, :status => :forbidden
      end

      if Devise.secure_compare(user.authentication_token, params[:token])
        sign_in user, store: false
        return
      end
    else
      # Return bad request response if user is not found
      render :json => { alert: 'Bad Request'}, :status => :bad_request
    end
  end
end
