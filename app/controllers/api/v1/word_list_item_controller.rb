class Api::V1::WordListItemController < ApplicationController
	include Api::V1::WordListItemConcerns

	def index
		begin
			@items = Api::V1::WordListItem.all

			render :index
		rescue Exception => e
			render json: { error: e }
		end
	end

	def show
		render :show
	end

	def create
		begin
			@item = Api::V1::WordListItem.new(word_list_item_params)

			if @item.save
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
			if @item.update(word_list_item_params)
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
			word = @item.word

			if @item.destroy
				render json: { message: "#{word} was deleted" }
			else
				render :error
			end
		rescue Exception => e
      render json: { error: e }
    end
	end
end
