class Ability
  include CanCan::Ability

  def initialize(user)
 		user ||= User.new # guest user

		if user.is? :admin
			can :manage, :all
		else
			can :manage, [Receipt, Folder, FolderType]
		end
  end
end
