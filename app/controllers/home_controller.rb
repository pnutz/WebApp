class HomeController < ApplicationController
  def index
	  if user_signed_in?
			@receipts = current_user.receipts.where(:folder_id => nil)
	  	@userFolders = current_user.folders;
			@tabs = current_user.folder_types;
	  end
  end
end
