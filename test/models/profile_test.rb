require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  def setup
    @profile = Profile.new(email: "user@example.com", role: 'admin', provider: 'identity', 
    uid: "15", author_id: "2")
  end

  test "should be valid" do
    assert @profile.valid?
  end
  
  # test "email should be present" do
  #   @profile.email = "     "
  #   assert_not @profile.valid?
  # end
  
  test "email should not be too long" do
    @profile.email = "a" * 60
    assert_not @profile.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @profile.email = valid_address
      assert @profile.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @profile.email = invalid_address
      assert_not @profile.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @profile.dup
    duplicate_user.email = @profile.email.upcase
    @profile.save
    assert_not duplicate_user.valid?
  end
  
  test "provider should be present" do
    @profile.provider = "     "
    assert_not @profile.valid?
  end
  
  test "uid should be present" do
    @profile.uid = "     "
    assert_not @profile.valid?
  end
end