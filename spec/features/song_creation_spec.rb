require 'rails_helper'

RSpec.describe "User creates a song" do

  before(:each) do 
    user = User.create({first_name: "John", last_name: "Smith", username: "JD2000", password: "123", password_confirmation: "123"})
    user.songs.create(title: "Bombs over Baghdad", artist: "Outkast")
    visit login_path
    fill_in "Username", with: "JD2000"
    fill_in "Password", with: "123"
    click_button "Login"
  end

  context "with valid attributes" do
    it "saves and displays the song title" do
      click_button "Add Song"
      fill_in "song[title]", with: "ABC"
      fill_in "song[artist]", with: "Jackson 5"
      click_button "Create Song"
      expect(page).to have_content('ABC')
      expect(page).to have_content('Jackson 5')
    end
  end
end