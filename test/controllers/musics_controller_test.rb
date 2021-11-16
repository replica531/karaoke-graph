require 'test_helper'

class MusicsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get musics_path
    assert_response :success
  end
end
