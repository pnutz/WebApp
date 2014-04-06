class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  #Class to handle omniauth callbacks for different subscribers
  def facebook
    puts "Facebook info"
    puts request.env["omniauth.auth"]["info"]
    puts "Facebook user id"
    puts request.env["omniauth.auth"]["uid"]
    puts "Facebook provider" 
    puts request.env["omniauth.auth"]["uid"]
    @user = Authorization.createOrFindFromFacebookOauth(request.env["omniauth.auth"])
    if @user.persisted?
      puts "user data persisted"
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      puts "user data not persisted"
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
