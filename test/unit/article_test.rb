require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  fixtures :articles
 setup do
   @article = articles(:one)
 end
 test 'article should not exist' do
  article = Article.find_by_title('Intro')
  assert_nil article
 end

  test 'assert two articles exists' do
    articles = Article.find(:all)
    assert_equal articles.count, 2
  end


  test 'article attributes must not be empty' do
    article = Article.new
    assert article.invalid?
    assert article.errors[:title].any?
    assert article.errors[:text].any?
  end
  
  test 'article title uniqueness' do
    article = Article.new(title: @article.title, text: @article.text)
    assert !article.save
  end
end
