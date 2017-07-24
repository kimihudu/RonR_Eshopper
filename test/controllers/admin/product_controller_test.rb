require 'test_helper'

class Admin::ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_product_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_product_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_product_edit_url
    assert_response :success
  end

  test "should get delete" do
    get admin_product_delete_url
    assert_response :success
  end

  test "should get new" do
    get admin_product_new_url
    assert_response :success
  end

end
