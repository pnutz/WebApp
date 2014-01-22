class HomeController < ApplicationController
  def index
	  if user_signed_in?
		@receipts = Receipt.where(:user_id => current_user.id).where(:folder_id => nil)
	  	@userFolders = Folder.where(:user_id => current_user.id);
	  end
  end
end
