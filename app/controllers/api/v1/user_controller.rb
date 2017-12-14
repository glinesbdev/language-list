class Api::V1::UserController < ApplicationController
	include Api::V1::UserConcerns

	def index
		@users = User.all

		render :index
	end

	def show
		render :show
	end

	def create
		@user = User.new(user_params)

		if @user.save
			render :show
		else
			render :error
		end
	end

	def update
		if @user.update_attributes(user_params)
			render :show
		else
			render :error
		end
	end

	def destroy
		email = @user.email
		if @user.destroy
			render json: { message: "#{email} was deleted" }
		else
			render :error
		end
	end
end
