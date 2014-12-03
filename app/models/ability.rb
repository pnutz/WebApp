class Ability
  include CanCan::Ability

  def initialize(user)
 		user ||= User.new # guest user

		alias_action :create, :read, :update, :destroy, :to => :crud

		if user.is? :admin
			can :manage, :all
		else
			can :read, :all
      cannot :read, [Receipt, ReceiptItem, ReceiptTax, Folder, FolderType, Document, UserSetting, Profile]
      can :crud, [Receipt, ReceiptItem, ReceiptTax, Folder, FolderType, Document, Tag, UserSetting, Profile], :user_id => user.id
		end
  end
end
