class UsersController < ApplicationController

	def update
	params.permit!
    User.update(params[:id], params[:user])
    redirect_to("/")
	end

end
