module Api
	module V1
		module WordListConcerns
			extend ActiveSupport::Concern

			included do
				before_action :authenticate_user!
  			before_action :get_list, only: [:show, :update, :destroy]
			end

			private 

			def word_list_params
		    params.permit(:name, :language)
		  end

		  def get_list
		    @word_list = Api::V1::WordList.find(params[:id])
		  end
		end
	end
end