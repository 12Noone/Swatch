class UsersController < ApplicationController

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			login!(@user)
			redirect_to root_path
			

		else
			flash[:message]=@user.errors.full_messages.to_sentence
			redirect_to new_user_path
		end
	end


	private

	def user_params
		 params.require(:user).permit(:name, :password)
	end
end
