require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'article'

describe Article do
  before do
    @article = FactoryGirl.build(:article)
  end
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text) }
  it { should validate_uniqueness_of(:title) }
  it { @article.should be_new }
end