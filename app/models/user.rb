class User < ActiveRecord::Base

  has_many :searches, :dependent => :destroy
  has_many :clicks, :dependent => :destroy
  has_many :purchases

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable,  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauthable #:confirmable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

   def self.find_for_facebook_oauth(access_token, signed_in_resource=nil, search=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user.searches << search if search
      user
    else # Create a user with a stub password. 
      user = User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
      user.searches << search if search
      user
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end
  
end
