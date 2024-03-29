class HomeController < ApplicationController
  skip_before_filter :authenticate_user_from_token!
  skip_before_filter :authenticate_user!

  def index
    # this makes it so the layout doesn't render for this action
    @disable_nav = true

    # please no double redirect
    if user_signed_in?
      sign_out_and_redirect(current_user)
    end

    # this is for old-index view
	  #if user_signed_in?
		#	@receipts = current_user.receipts.where(:folder_id => nil)
		#	@tabs = current_user.folder_types
	  #end
  end
end
