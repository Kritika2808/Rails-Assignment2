class RegistrationController < Devise::RegistrationsController
	def new
		@user = User.new
		@detail = Detail.new
	end

	def create
		@user = User.new
		@detail = Detail.new
                @role=Role.new
		
		@user.email = params[:user][:email]
		@user.password = params[:user][:password]
		@user.password_confirmation = params[:user][:password_confirmation]

		@detail.firstname = params[:detail][:firstname]
		@detail.lastname = params[:detail][:lastname]
		@detail.gender = params[:detail][:gender]
		@detail.contact = params[:detail][:contact]
		@detail.address = params[:detail][:address]
                @role.role="User"
                @detail.valid?
		if @detail.errors.blank?
		@user.valid?
		if @user.errors.blank?
			if @user.save

				@detail.user = @user
                                @role.user=@user

				if @detail.save
					
                                    if @role.save
                                            redirect_to new_user_session_path
                                     else
                                        render 'new'
                                     end

				else
					render 'new'
				end
			else
				render 'new'
			end
		else
			render 'new'
		end
            else
		render 'new'
	   end
	end

	def edit
		@resource_name = User.find(current_user.id)
	end

 
end
