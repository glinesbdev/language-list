class Api::V1::TranslateController < ApplicationController
  before_action :get_params
  before_action :setup_translator

  def index
    @words = @translator.translate(params[:from], params[:to], *params[:words])
    @languages = @translator.detect(*@words)

    render :index
  end

  def languages
    @languages = @translator.languages

    render :languages
  end

  private

  def get_params
    params.permit(:from, :to, :words => [])
  end

  def setup_translator
    @translator = Translator.new
  end
end
