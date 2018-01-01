class Api::V1::TranslateController < ApplicationController
  # before_action :authenticate_user!
  before_action :get_params

  def index
    translator = Translator.new
    @words = translator.translate(params[:to], params[:from], *params[:words])
    @languages = translator.detect(*@words)

    render :index
  end

  private

  def get_params
    params.permit(:from, :to, :words => [])
  end
end
