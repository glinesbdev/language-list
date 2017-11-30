class HomeController < ApplicationController
  def index
  	render json: { error: "This isn't a valid route!" }
  end
end
