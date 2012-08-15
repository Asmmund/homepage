class AdminController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @greetings = 'It\'s now ' + Time.now.to_s
  end
end
