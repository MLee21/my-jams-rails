require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can create a song" do
    visit new_song_path
    fill_in "song[title]", with: "Thriller"
    fill_in "song[artist]", with: "Michael Jackson"
    click_button "Create Song"
    assert page.has_content?("Thriller")
    assert page.has_content?("Michael Jackson")
  end
end