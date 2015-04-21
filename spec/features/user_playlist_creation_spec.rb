require 'rails_helper'

feature "user creates a playlist" do 

  before(:each) do 
    @user = User.create({first_name: "John", last_name: "Smith", username: "JD2000", password: "123", password_confirmation: "123"})
    @user.songs.create(title: "Bombs over Baghdad", artist: "Outkast")
    visit login_path
    fill_in "Username", with: "JD2000"
    fill_in "Password", with: "123"
    click_button "Login"
  end

  scenario "when a user is logged in" do
    expect(page).to have_content("Outkast")
    expect(page).to have_content("John's Playlist")
  end

  scenario "and adds a new song" do 
    click_button "Add Song"
    fill_in "song[title]", with: "Two Weeks"
    fill_in "song[artist]", with: "FKA Twigs"
    click_button "Create Song"
    expect(page).to have_content("Two Weeks")
    expect(page).to have_content("FKA Twigs")
  end

   scenario "and edits a song" do 
    click_button "Edit"
    fill_in "song[title]", with: "Bye,Bye,Bye"
    fill_in "song[artist]", with: "NSync"
    click_button "Update Song"
    expect(page).to have_content("Bye,Bye,Bye")
    expect(page).to have_content("NSync")
  end

  scenario "and deletes a song" do 
    expect(page).to have_content("Bombs over Baghdad")
    expect(page).to have_content("John's Playlist")
    click_button "Delete"
    expect(page).to_not have_content("Bombs over Baghdad")
  end
end

feature "user goes to playlist" do 

   before(:each) do 
    @user = User.create({first_name: "John", last_name: "Smith", username: "JD2000", password: "123", password_confirmation: "123"})
    @user.songs.create(title: "Bombs over Baghdad", artist: "Outkast")
    @user.songs.create(title: "ABC", artist: "Michael Jackson")
    @user.songs.create(title: "Baby Got Back", artist: "Sir Mixalot")
    visit login_path
    fill_in "Username", with: "JD2000"
    fill_in "Password", with: "123"
    click_button "Login"
  end

  scenario "and deletes all songs" do 
    expect(page).to have_content("Bombs over Baghdad")
    expect(page).to have_content("ABC")
    expect(page).to have_content("Baby Got Back")
    expect(page).to have_content("John's Playlist")

    click_button "Delete All"
    expect(page).to_not have_content("Bombs over Baghdad")
    expect(page).to_not have_content("ABC")
    expect(page).to_not have_content("Baby Got Back")
    expect(page).to have_content("Your shit is gone")
  end
end