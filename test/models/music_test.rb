require 'test_helper'

class MusicTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @music = @user.musics.new(title: "いいんですか", artist: "RADWIMPS")
  end

  test "should be valid" do
    assert @music.valid?
  end

  test "user id should be present" do
    @music.user_id = nil
    assert_not @music.valid?
  end

  test "title should be present" do
    @music.title = "   "
    assert_not @music.valid?
  end

  test "artist should be present" do
    @music.artist = "  "
    assert_not @music.valid?
  end
end
