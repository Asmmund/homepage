require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index" do
    user = users(:one)
    session[:user_id] = user.id
    get :index
    assert_response :success
  end

  test "should not get index" do
    user = users(:one)

    get :index
    assert_response :error
  end

end