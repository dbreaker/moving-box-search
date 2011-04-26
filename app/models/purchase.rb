class Purchase < ActiveRecord::Base
  
  belongs_to :user

  validates_uniqueness_of :aff_transaction_id

  def buy_coffee
    # Create a new mechanize object
    agent = Mechanize.new { |a| a.log = Logger.new(STDERR) }

    # Load the rubyforge website
    page = agent.get('https://www.starbucks.com/shop/card/egift')
#    page = agent.click page.link_with(:text => /Log In/) # Click the login link
#    form = page.forms[1] # Select the first form
#    form.form_loginname = ARGV[0]
#    form.form_pw        = ARGV[1]

    # Submit the form
#    page = agent.submit(form, form.buttons.first)

    puts page.body # Print out the body

  end
  
end
