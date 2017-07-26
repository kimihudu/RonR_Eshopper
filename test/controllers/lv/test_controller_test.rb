require 'test_helper'

class Lv::TestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lv_test_index_url
    assert_response :success
  end

end
