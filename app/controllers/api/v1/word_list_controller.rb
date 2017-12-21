class Api::V1::WordListController < ApplicationController
  include Api::V1::WordListConcerns

  def index
    begin
      @word_lists = current_user.word_lists

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
      @word_list = Api::V1::WordList.new(word_list_params)
      current_user.word_lists << @word_list

      if @word_list.save
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
      if @word_list.update_attributes(word_list_params)
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
      list_name = @word_list.name

      if @word_list.destroy
        render json: { message: "#{list_name} has been deleted." }
      else
        render :error
      end
    rescue Exception => e
      render json: { error: e }
    end
  end
end
