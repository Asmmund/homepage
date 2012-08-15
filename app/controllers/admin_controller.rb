class AdminController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @greetings = 'It\'s now ' + Time.now
  end
end
