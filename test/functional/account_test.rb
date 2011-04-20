require 'test_helper'

class AccountTest < ActionMailer::TestCase
  test "after_create" do
    mail = Account.after_create
    assert_equal "After create", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
