# frozen_string_literal: true

require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @other_user = users(:two)
    @tune = tunes(:one)
    log_in_as(@user)
  end

  test 'should get index' do
    get user_tune_results_path(@user, @tune)
    assert_response :success
  end
end
