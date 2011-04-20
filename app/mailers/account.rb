class Account < ActionMailer::Base
  default :from => "support@MovingBoxSearch.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account.after_create.subject
  #
  def after_create(user)
    @greeting = "Hi"

    mail :to => user.email
  end
end
