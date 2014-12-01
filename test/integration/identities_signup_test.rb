# require 'test_helper'

# class IdentitiesSignupTest < ActionDispatch::IntegrationTest

#   test "invalid signup information" do
#     get signup_path
#     assert_no_difference 'Identity.count' do
#       OmniAuth.config.mock_auth[:identity] = {
#         email: 'marcos@mail.com',
#         password: '121212'
#       }
#     end
#     assert_template 'profiles/new'
#   end
  
#   test "valid signup information" do
#     get signup_path
#     assert_difference 'Identity.count', 1 do
#       post "/auth/identity/register", identity: { 
#                                                   email: "user@example.com",
#                                                   password:      "password" }
#     end
#     # assert_template 'static_pages/home'
#     # assert is_signed_in?
#   end
# end