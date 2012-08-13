class ShowController < ApplicationController
  def index
    @news = News.find(:all, :order=>'updated_at desc')
  end
end
