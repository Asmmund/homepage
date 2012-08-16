class ShowController < ApplicationController
  skip_before_filter :authorize
  def index
    if params[:set_locale]
      redirect_to show_path(locale: params[:set_locale])
    else
      @news = News.paginate page: params[:page], 
        order: 'updated_at desc', per_page: 5
    end
    
  end
end
