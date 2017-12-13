class Api::V1::WordListController < ApplicationController
  before_action :authenticate_user!
  before_action :get_list, only: [:show, :update, :destroy]

  def index
    @word_lists = current_user.word_lists

    render :index
  end

  def show
    render :show
  end

  def create
    @word_list = Api::V1::WordList.new(word_list_params)
    current_user.word_lists << @word_list

    if @word_list.save
      render :show
    else
      render :error
    end
  end

  def update
    if @word_list.update(word_list_params)
      render :show
    else
      render :error
    end
  end

  def destroy
    list_name = @word_list.name

    if @word_list.destroy
      render json: { message: "#{list_name} has been deleted." }
    else
      render :error
    end
  end

  private

  def word_list_params
    params.permit(:name, :language)
  end

  def get_list
    @word_list = Api::V1::WordList.find(params[:id])
  end
end
