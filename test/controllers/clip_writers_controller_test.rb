require 'test_helper'

class ClipWritersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clip_writers_index_url
    assert_response :success
  end

end
