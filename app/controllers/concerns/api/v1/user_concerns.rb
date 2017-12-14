module Api
	module V1
		module UserConcerns
			extend ActiveSupport::Concern

			included do
				before_action :authenticate_user!
				before_action :find_user, except: [:index, :create]
			end

			private 

			def user_params
				params.permit(:email, :username, :admin, :password, :password_confirmation)
			end	

			def find_user
				@user = User.find(params[:id])
			end
		end
	end
end