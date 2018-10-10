require 'test_helper'

class FrontdeskControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get frontdesk_index_url
    assert_response :success
  end

  test "should get new" do
    get frontdesk_new_url
    assert_response :success
  end

end
