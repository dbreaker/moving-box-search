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
    amount_purchased = 5
    
    #go to the ecom page, fill out our iinfo
    next_page = page.form_with(:action => '/shop/card/egift/DRFNDZYU') do |form|
      form.recipient_name = to
      form.message = msg
      form.amount = amount_purchased
      form.sender_name = "MovingBoxSearch.com"
      form.sender_email = "support@MovingBoxSearch.com"
      form.recipient_email = self.user.email
    end.submit
    
    #get to the checkout form and submit it
    checkout_form = next_page.form_with(:action => '/shop/UpdateeGiftCart')
    login_page = agent.submit(checkout_form, checkout_form.buttons[1])

    #login to our account and submit to get to the purchase page
    login_form = login_page.form_with(:action => "/account/signin?returnurl=%2Fshop%2Fcheckout&allowguest=true")
    login_form.fields_with(:name => "Account.UserName").first.value = "nanceskitchen"
    login_form.fields_with(:name => "Account.PassWord").first.value = "Tcmi08mnidb"
    purchase_page = agent.submit(login_form, login_form.buttons.first)

    #buy some coffee, and record the details on the purchase record
    purchase_page.forms.first.radiobuttons[1].check
    cc_page =  agent.submit(purchase_page.forms.first, purchase_page.forms.first.buttons.last)
    
    cvn = "381"
    cc_form = cc_page.form_with(:action => "/shop/paymentmethod")
		cc_form.fields_with(:name => "PaymentMethod.CVN").first.value = cvn
    confirm_page =  agent.submit(cc_form, cc_form.buttons.last)

    #purchase a giftcard
		purchase_link = confirm_page.link_with(:text => "Purchase")
    confirmation_page = agent.click(purchase_link)
    doc = Nokogiri::HTML(confirmation_page.body)
    confirmation_number = doc.css('dl.order_info').last.css('dd.inline').last.inner_html.gsub(/\r|\n|\t|<br>/,"")
    #set starbucks fields confirmation_number
    self.starbucks_amount_purchased = amount_purchased
    self.starbucks_sent_to_email = self.user.email
    self.starbucks_confirmation_number = confirmation_number
    self.starbucks_sent_at = Time.now()
    self.save!
    self
    #send email to user that we bought them coffee!
    self.send_coffee_email
  end
  
  def send_coffee_email
    Account.bought_coffee(self).deliver
  end
  
end
