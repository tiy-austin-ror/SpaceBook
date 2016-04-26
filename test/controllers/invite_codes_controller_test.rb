require 'test_helper'

class InviteCodesControllerTest < ActionController::TestCase
  include FactoryGirl::Syntax::Methods
  test "should get create" do
    sign_in

    event = create(:event)

    get :create, { invite: { event_id: event.id } }
    assert_response :success
  end
end
