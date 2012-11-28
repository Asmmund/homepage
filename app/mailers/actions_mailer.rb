class ActionsMailer < ActionMailer::Base
  default from: "Elmor's homepage<admin@elmor.org.ua>", to: 'antony.ermolenko@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.actions_mailer.article_added.subject
  #
  def article_added article
    @article = article

    mail subject: "A new article was added #{article.title} at #{article.created_at}"
  end
end
