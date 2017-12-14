module Api
	module V1
		module WordListItemConcerns
			extend ActiveSupport::Concern

			included do
				before_action :authenticate_user!
				before_action :get_item, except: [:index, :create]
			end

			private

			def word_list_item_params
				params.permit(:word, :translation, :context, :word_list_id)
			end

			def get_item
				@item = Api::V1::WordListItem.find(params[:id])
			end
		end
	end
end