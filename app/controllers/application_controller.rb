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

  def authenticate_user_from_token!
    user_email = params[:email].presence
    user = user_email && User.find_by_email(user_email)
    if user 
      if Devise.secure_compare(user.authentication_token, params[:token])
        sign_in user, store: false
        return
      end

      # only come down here if first authentication fails11
      if ENV_VARIABLES[:useTestToken] && params[:token] == "TestTokenMothafucka"
        sign_in user, store: false
      end
    end
  end
end
