class DetailsController < ApplicationController
	def show
		@detail=Detail.find(params[:id])
		if (current_user.role.role!="admin")
		render :layout=>'ajax'
		end
	end
end
