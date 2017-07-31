require 'test_helper'

class Admin::ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_profile_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_profile_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_profile_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_profile_edit_url
    assert_response :success
  end

end
