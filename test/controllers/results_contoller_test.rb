# frozen_string_literal: true

require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @music = musics(:one)
    log_in_as(@user)
  end

  test 'should get index' do
    get user_music_results_path(@user, @music)
    assert_response :success
  end
end
