require 'test_helper'

class ProfilesSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Profile.count' do
      post profiles_path, profile: { email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'profiles/new'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'Profile.count', 1 do
      post_via_redirect profiles_path, profile: { email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password",
                                            author_id: '1' }
    end
    # assert_template 'authors/show'
  end
end