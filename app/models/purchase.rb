class Purchase < ActiveRecord::Base
  
  belongs_to :user

  validates_uniqueness_of :aff_transaction_id

  def buy_coffee
    # Create a new mechanize object
    agent = Mechanize.new { |a| a.log = Logger.new(STDERR) }

#    page = agent.get("https://www.starbucks.com/account/signin")
    page = agent.get('https://www.starbucks.com/shop/card/egift')
    to = "Awesome Person"
    msg = "Thank you so much for buying your Moving Boxes through MovingBoxSearch.com.  Please enjoy this free coffee on us, we hope it makes your move day better."
#    page = agent.click page.link_with(:text => /Log In/) # Click the login link
    next_page = page.form_with(:action => '/shop/card/egift/DRFNDZYU') do |form|
      form.recipient_name = to
      form.message = msg
      form.amount = 5
      form.sender_name = "MovingBoxSearch.com"
      form.sender_email = "support@MovingBoxSearch.com"
      form.recipient_email = self.user.email
    end.submit
    
#    puts next_page.body # Print out the body
    
    checkout_form = next_page.form_with(:action => '/shop/UpdateeGiftCart')
    login_page = agent.submit(checkout_form, checkout_form.buttons[1])
#    puts login_page.body # Print out the body

    login_form = login_page.form_with(:action => "/account/signin?returnurl=%2Fshop%2Fcheckout&allowguest=true")
    login_form.fields_with(:name => "Account.UserName").first.value = "nanceskitchen"
    login_form.fields_with(:name => "Account.PassWord").first.value = "Tcmi08mnidb"
    purchase_page = agent.submit(login_form, login_form.buttons.first)

    purchase_page
		

  end
  
end
