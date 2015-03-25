require 'test_helper'

class ShiftMailerTest < ActionMailer::TestCase
  test "shift_notify" do
    mail = ShiftMailer.shift_notify
    assert_equal "Shift notify", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
