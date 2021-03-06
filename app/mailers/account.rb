class Account < ActionMailer::Base
  default :from => "support@MovingBoxSearch.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account.after_create.subject
  #
  def after_create(user)
    @greeting = "Hi"
    mail( 
      :to => user.email,
      :subject => "Welcome to MovingBoxSearch.com!",
      :bcc => "dbreaker@gmail.com")
  end
  
  def bought_coffee(purchase)
    @purchase = purchase
    mail( 
      :to => purchase.user.email,
      :subject => "You've Got Free Coffee from MovingBoxSearch.com!",
      :bcc => "dbreaker@gmail.com")
  end

end
