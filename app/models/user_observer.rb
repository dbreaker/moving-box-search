class UserObserver < ActiveRecord::Observer
  
  def after_create(user)
    Account.after_create(user).deliver
  end
  
end
