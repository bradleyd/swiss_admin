require_relative "test_helper"

class UserTest < Minitest::Test
  def test_current_return_logged_in_user
    assert_equal SwissAdmin::TestHelpers.current_user, 
      SwissAdmin::User.current[:raw]
  end

  def test_home_returns_home_directory_for_current_user
    assert_equal SwissAdmin::TestHelpers.home, 
      SwissAdmin::User.home[:raw]
  end

  def test_active_returns_all_logged_in_users
    assert SwissAdmin::User.active[:raw]
  end
end
