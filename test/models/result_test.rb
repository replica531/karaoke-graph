require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  def setup
    @music = musics(:one)
    @result = @music.results.new(score: 85.3, memo: "hoge", datetime:Time.now)
  end

  test "should be valid" do
    assert @result.valid?
  end

  test "music id should be present" do
    @result.music_id = nil
    assert_not @result.valid?
  end

  test "datetime should be present" do
    @result.datetime = nil
    assert_not @result.valid?
  end
end
