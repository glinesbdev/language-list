class HomeController < ApplicationController
  def index
  	render json: { error: "This isn't a valid route!" }
  end

  def successful_signup
  	render json: { data: current_user, message: 'Sign up successful' }
  end
end
