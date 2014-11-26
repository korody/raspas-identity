require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @profile = profiles(:elvis)
    remember(@profile)
  end

  test "current_user returns right user when session is nil" do
    assert_equal @profile, current_user
    assert is_signed_in?
  end

  test "current_user returns nil when remember digest is wrong" do
    @profile.update_attribute(:remember_digest, Profile.digest(Profile.new_token))
    assert_nil current_user
  end
end