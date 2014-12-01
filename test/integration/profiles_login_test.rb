require 'test_helper'

class ProfilesLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @profile = profiles(:elvis)
  end
  
  test "login with invalid information" do
    get signin_path
    assert_template 'sessions/new'
    post signin_path, { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "login with valid information followed by logout" do
    get signin_path
    post "/auth/identity/callback", { auth_key: @profile.email, password: 'password' }
    # assert is_signed_in?
    assert_redirected_to root_path
    # follow_redirect!
    # assert_template 'static_pages/home'
  #   assert_select "a[href=?]", signin_path, count: 0
  #   assert_select "a[href=?]", signout_path
  #   # assert_select "a[href=?]", user_path(@user)
  #   delete signout_path
  #   assert_not is_signed_in?
  #   assert_redirected_to root_url
  # # Simulate a user clicking logout in a second window.
  #   delete signout_path
  #   follow_redirect!
  #   assert_select "a[href=?]", signin_path
  #   assert_select "a[href=?]", signout_path,      count: 0
  #   # assert_select "a[href=?]", profile_path(@profile), count: 0
  end
  
  # test "login with remembering" do
  #   sign_in_as(@profile, remember_me: '1')
  #   assert_not_nil cookies['remember_token']
  # end

  # test "login without remembering" do
  #   sign_in_as(@profile, remember_me: '0')
  #   assert_nil cookies['remember_token']
  # end
end