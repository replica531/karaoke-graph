# frozen_string_literal: true

require 'test_helper'

class TuneTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @tune = @user.tunes.new(title: 'いいんですか', artist: 'RADWIMPS')
  end

  test 'should be valid' do
    assert @tune.valid?
  end

  test 'user id should be present' do
    @tune.user_id = nil
    assert_not @tune.valid?
  end

  test 'title should be present' do
    @tune.title = '   '
    assert_not @tune.valid?
  end

  test 'artist should be present' do
    @tune.artist = '  '
    assert_not @tune.valid?
  end
end
