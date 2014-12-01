# require 'test_helper'

# class ProfilesSignupTest < ActionDispatch::IntegrationTest

#   test "invalid signup information" do
#     get signup_path
#     assert_no_difference 'Profile.count' do
#       post profiles_path, profile: { email: "user@invalid",
#                               role:                 "user",
#                               provider:         "identity",
#                               uid:                   "15" }
#     end
#     # assert_template 'profiles/new'
#   end
  
#   test "valid signup information" do
#     get signup_path
#     assert_difference 'Profile.count', 1 do
#       post_via_redirect profiles_path, profile: { email:       "user@mail.com",
#                                                   role:                 "user",
#                                                   provider:         "identity",
#                                                   uid:                   "15" }
#     end
#     assert_template 'static_pages/home'
#     assert is_signed_in?
#   end
# end