class Api::V1::WordListItemController < ApplicationController
	include Api::V1::WordListItemConcerns

	def index
		@items = Api::V1::WordListItem.all

		render :index
	end

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
end
