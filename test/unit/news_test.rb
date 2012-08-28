require 'test_helper'

class NewsTest < ActiveSupport::TestCase
 fixtures :news
 setup do
   @news = news(:one)
 end
 test 'news should not exist' do
  news = News.find_by_title('Intro')
  assert_nil news
 end

  test 'assert two news exists' do
    news = News.find(:all)
    assert_equal news.count, 2
  end
end
