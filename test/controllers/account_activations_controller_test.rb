require 'test_helper'

class AccountActivationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @non_activated = users(:non_activated)
  end

  test "should not allow non-activated user" do
    log_in_as(@non_activated)
    assert_not @non_activated.activated?
    get users_path
    assert_select 'a[href=?]', user_path(@non_activated), count: 0
    get user_path(@non_activated)
    assert_redirected_to root_url
  end
end
