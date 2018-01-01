class Api::V1::UserController < ApplicationController
	include Api::V1::UserConcerns

	def index
		begin
			@users = User.all

			render :index
		rescue Exception => e
			render json: { error: e }
		end
	end

	def show
		begin
			render :show
		rescue Exception => e
			render json: { error: e }
		end
	end

	def create
		begin
			@user = User.new(user_params)

			if @user.save
				render :show
			else
				render :error
			end
		rescue Exception => e
			render json: { error: e }
		end
	end

	def update
		begin
			if @user.update_attributes(user_params)
				render :show
			else
				render :error
			end
		rescue Exception => e
			render json: { error: e }
		end
	end

	def destroy
		begin
			email = @user.email
			if @user.destroy
				render json: { message: "#{email} was deleted" }
			else
				render :error
			end
		rescue Exception => e
			render json: { error: e }
		end
	end
end
