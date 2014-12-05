# require 'test_helper'

# class IdentityTest < ActiveSupport::TestCase

#   def setup
#     @identity = Identity.new(email: "user@example.com", password: "password")
#   end

#   test "should be valid" do
#     assert @identity.valid?
#   end
  
#   test "email should be present" do
#     @identity.email = "     "
#     assert_not @identity.valid?
#   end
  
#   test "email should not be too long" do
#     @identity.email = "a" * 60
#     assert_not @identity.valid?
#   end
  
#   test "email validation should accept valid addresses" do
#     valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
#                         first.last@foo.jp alice+bob@baz.cn]
#     valid_addresses.each do |valid_address|
#       @identity.email = valid_address
#       assert @identity.valid?, "#{valid_address.inspect} should be valid"
#     end
#   end
  
#   test "email validation should reject invalid addresses" do
#     invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
#                           foo@bar_baz.com foo@bar+baz.com]
#     invalid_addresses.each do |invalid_address|
#       @identity.email = invalid_address
#       assert_not @identity.valid?, "#{invalid_address.inspect} should be invalid"
#     end
#   end
  
#   test "email addresses should be unique" do
#     duplicate_user = @identity.dup
#     duplicate_user.email = @identity.email.upcase
#     @identity.save
#     assert_not duplicate_user.valid?
#   end
  
#   test "password should have a minimum length" do
#     @identity.password = @identity.password_confirmation = "a" * 5
#     assert_not @identity.valid?
#   end

  # test "provider should be present" do
  #   @profile.provider = "     "
  #   assert_not @profile.valid?
  # end
  
  # test "uid should be present" do
  #   @profile.uid = "     "
  #   assert_not @profile.valid?
  # end
# end