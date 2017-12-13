class Api::V1::WordListItemController < ApplicationController
	before_action :authenticate_user!
	before_action :get_item, except: [:create]
	before_action :get_list, except: [:destroy]

	def show
		render :show
	end

	def create
		@item = Api::V1::WordListItem.new(word_list_item_params)

		if @item.save
			render :show
		else
			render :error
		end
	end

	def update
		if @item.update(word_list_item_params)
			render :show
		else
			render :error
		end
	end

	def destroy
		word = @item.word

		if @item.destroy
			render json: { message: "#{word} was deleted" }
		else
			render :error
		end
	end

	private

	def word_list_item_params
		params.permit(:word, :translation, :context, :word_list_id)
	end

	def get_item
		@item = Api::V1::WordListItem.find(params[:id])
	end

	def get_list
		@list = Api::V1::WordList.find(@item.word_list_id)
	end
end
