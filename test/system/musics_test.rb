# frozen_string_literal: true

require 'application_system_test_case'

class TunesTest < ApplicationSystemTestCase
  setup do
    @tune = tunes(:one)
  end

  test 'visiting the index' do
    visit tunes_url
    assert_selector 'h1', text: 'Tunes'
  end

  test 'creating a Tune' do
    visit tunes_url
    click_on 'New Tune'

    fill_in 'Artist', with: @tune.artist
    fill_in 'Title', with: @tune.title
    fill_in 'User', with: @tune.user_id
    click_on 'Create Tune'

    assert_text 'Tune was successfully created'
    click_on 'Back'
  end

  test 'updating a Tune' do
    visit tunes_url
    click_on 'Edit', match: :first

    fill_in 'Artist', with: @tune.artist
    fill_in 'Title', with: @tune.title
    fill_in 'User', with: @tune.user_id
    click_on 'Update Tune'

    assert_text 'Tune was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Tune' do
    visit tunes_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Tune was successfully destroyed'
  end
end
