class ShowController < ApplicationController
  skip_before_filter :authorize
  def index
    @news = News.paginate page: params[:page], order: 'updated_at desc',
        per_page: 5
  end
end
