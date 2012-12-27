class NewsSweeper < ActionController::Caching::Sweeper
  def sweep(news)
    expire_fragment 'news_list'
  end

  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
end