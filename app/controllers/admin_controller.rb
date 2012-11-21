class AdminController < ApplicationController
  def index
  	# user_nex = User.find_by_name(:name)
    @user = User.find(session[:user_id])
    @greetings = 'It\'s now ' + Time.now.to_s
  end
end
