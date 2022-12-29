# frozen_string_literal: true

require 'test_helper'

class TunesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @other_user = users(:two)
    log_in_as(@user)
  end

  test 'should get index' do
    get user_tunes_path(@user)
    assert_response :success
  end
end
