require 'test_helper'

class SerchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get serch_index_url
    assert_response :success
  end

end
