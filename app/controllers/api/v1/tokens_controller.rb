require 'facebook_api_module'
class Api::V1::TokensController < ApplicationController
  #Don't have to authenticate user when accessing tokencontroller
  skip_before_filter :verify_authenticity_token, :authenticate_user!
  respond_to :json
  #Page for how to use this module
  #http://matteomelani.wordpress.com/2011/10/17/authentication-for-mobile-devices/
  def create
    email = params[:email]
    password = params[:password]
    fbAccessToken = params[:fbAccessToken]
    # if format is not json
    if request.format != :json
      render :status=>406, :json=>{:message=>"The request must be json"}
      return
    end

    # if email does not exist 
    if email.nil?
      render :status=>400,
             :json=>{:message=>"The request must contain the user email"}
      return
    end
    # make sure we have a password or an access token
    if password.nil? 
      # Check if we have access token
      if fbAccessToken.nil?
        # we only want to send error response for missing password
        render :status=>400,
               :json=>{:message=>"The request must contain the user password"}
      else
        # Check that the access token is for our application
        fbAppResponse = FacebookApiModule::get_app_info(fbAccessToken);
        # Get the application token
        fbUserResponse = FacebookApiModule::get_user_info(fbAccessToken);
        if fbUserResponse.code == "200"
          fbUserInfo = JSON.parse(fbUserResponse.body)
          # When logging in through facebook we should use
          # the facebook user id to locate the user
          puts "fbUserinfo is "
          puts fbUserInfo["id"]
          @user = Authorization.createOrFindFromFacebookOauth(email, fbUserInfo["id"])
          # try to find the user in the authorization table
          puts "Internal id is"
          logger.info("User #{email}.")
          # Generate new authentication token on sign in
          @user.authentication_token = generate_authentication_token
          # Generate new expiry date
          @user.expire_date = DateTime.now + 2.weeks 
          @user.save
          render :status=>200,
                 :json=>{:token => @user.authentication_token, :user => @user.id, :message=>"Fb OAuth Success"}
        end
      end
      return
    else
      # regular email password authentication
      @user=User.find_by_email(email.downcase)
      email_password_login(email, password);
    end
  end

  def destroy
    @user=User.find_by_authentication_token(params[:id])
    if @user.nil?
      logger.info("Token not found.")
      render :status=>404, :json=>{:message=>"Invalid token."}
    else
      @user.reset_authentication_token!
      render :status=>200, :json=>{:token=>params[:id]}
    end
  end

  private 

  def email_password_login(email, password)
    @user=User.find_by_email(email.downcase)
      
    if @user.nil?
      logger.info("User #{email} failed signin, user cannot be found.")
      render :status=>401, :json=>{:message=>"Invalid email or password."}
      return
    end
                       
    if not @user.valid_password?(password)
      logger.info("User #{email} failed signin, password is invalid")
      render :status=>401, :json=>{:message=>"Invalid email or password."}
    else
      logger.info("User #{email}.")
      # Generate new authentication token on sign in
      @user.authentication_token = generate_authentication_token
      # Generate new expiry date
      @user.expire_date = DateTime.now + 2.weeks 
      @user.save
      render :status=>200, :json=>{:token=>@user.authentication_token, :user=>@user.id}
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end



end
