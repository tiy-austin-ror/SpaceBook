require 'test_helper'

class EventMailerTest < ActionMailer::TestCase
  include FactoryGirl::Syntax::Methods

  test "new_event" do
    mail = EventMailer.new_event(create(:event))
    assert_equal "Test email", mail.subject
    assert_equal ["1-user@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "please visit the event page", mail.body.encoded
  end
end
