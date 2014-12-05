# require 'test_helper'

# class ProfilesSignupTest < ActionDispatch::IntegrationTest

#   def setup
#     @profile = profiles(:elvis)
#     request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:identity]
#   end
  
#   test "invalid signup information" do
#     get signup_path
#     assert_no_difference 'Profile.count' do
#       post profiles_path, profile: { email: "user@invalid",
#                                     role:          "user",
#                                     password:      "1212" }
#     end
#     assert_template 'profiles/new'
#   end

#   test "valid signup information" do
#     get signup_path
#     auth = OmniAuth.config.mock_auth[:identity]
#     assert_difference 'Profile.count' do
#       post_via_redirect "/auth/identity", { email: auth.email, password: 'password' }
#     end
#     assert_template 'authors/show'
#     assert_response :success
#     assert is_signed_in?
#   end
# end