require 'test_helper'

class FollowingArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get following_artists_index_url
    assert_response :success
  end

end
