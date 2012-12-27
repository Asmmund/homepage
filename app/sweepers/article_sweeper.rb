class ArticleSweeper < ActionController::Caching::Sweeper
  def sweep(article)
    expire_fragment 'article_list'
  end

  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
end