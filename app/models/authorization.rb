class Authorization < ActiveRecord::Base

  #Log in using facebook Oauth
  def self.createOrFindFromFacebookOauth(auth)
    #search the table for matching provider and uid
    authInfo = where(auth.slice(:provider, :uid)).first_or_create do |newAuth|
      #if we cannot find a match, create new user and new authorization
      user = User.create({:email => auth.info.email}) do |u|
        u.role = "user"
        #devise requires us to set password (not encrypted_password)
        u.password= Devise.friendly_token[0,20]
      end
      
      #Set up new authorization record
      newAuth.provider         = auth.provider
      newAuth.uid              = auth.uid
      newAuth.internal_id      = user.id
    end

    return User.find(authInfo.internal_id)
  end
end
