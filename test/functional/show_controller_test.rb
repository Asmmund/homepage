require 'test_helper'

class ShowControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_select '#content .menu>ul>li',minimum:2
    assert_select 'h1', 'News'
    assert_select 'h3',minimum:2
  end

end
