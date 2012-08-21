class ApplicationController < ActionController::Base
  before_filter :set_locale_from_params
  before_filter :authorize
  protect_from_forgery
  protected
  def set_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
       I18n.locale = params[:locale]
      else
        flash.now[:notice] =
        "#{params[:locale]} translation\'s not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
end
