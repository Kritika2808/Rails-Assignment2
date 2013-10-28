class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new # guest user (not logged in)
		if user_signed_in?
			if user.has_role? :admin
				redirect_to new_book_path#can :manage, [User,Book]
			else
				can :read, :all
			end
		end
	end
end
