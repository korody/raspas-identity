# encoding: utf-8
require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "raspas | novo usuário"
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end
end