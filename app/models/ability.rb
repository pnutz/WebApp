class Ability
  include CanCan::Ability

  def initialize(user)
 		user ||= User.new # guest user

		alias_action :create, :read, :update, :destroy, :to => :crud

		if user.is? :admin
			can :manage, :all
		else
			can :read, :all
      cannot :read, [Receipt, Folder, FolderType, Document]
      can :crud, [Receipt, Folder, FolderType, Document], :user_id => user.id
		end
  end
end
