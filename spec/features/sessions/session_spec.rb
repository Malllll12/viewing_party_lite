require 'rails_helper'

RSpec.describe "register" do
  # it 'registers a new users name and email' do
  #   visit '/register'
  #
  #   expect(page).to have_content("Viewing Party Lite")
  #   expect(page).to have_content("Register a New User")
  #
  #   fill_in :name, with: "Mallory Vining"
  #   fill_in :email, with: "eurotrashdemon@gmail.com"
  #   fill_in :password, with: "wow_secure"
  #   fill_in :password_confirmation, with: "wow_secure"
  #
  #   click_button "Create New User"
  #
  #   expect(current_path).to eq(root_path)
  # end
  #
  # it 'only works if forms are correct' do
  #   visit '/register'
  #
  #   expect(page).to have_content("Viewing Party Lite")
  #   expect(page).to have_content("Register a New User")
  #
  #   fill_in :name, with: "Mallory Vining"
  #   fill_in :email, with: nil
  #
  #   click_button "Create New User"
  #   expect(current_path).to eq('/register')
  #   expect(page).to have_content("This user could not be created. Please check your form.")
  # end

  describe "Logging in" do
    it "can log in with valid credentials" do
      user = User.create(name: "Mal", email: "eurotrashdemon@gmail.com", password: "wow_secure")

      visit "/register"

      click_on "I already have an account"

      expect(current_path).to eq("/login")

      fill_in :email, with: user.email
      fill_in :password, with: user.password

      click_on "Log In"

      expect(current_path).to eq(root_path)
    end

    it "can't log in without valid credentials" do
      user = User.create(name: "Mal", email: "eurotrashdemon@gmail.com", password: "wow_secure")

      visit "/login"

      fill_in :email, with: user.email
      fill_in :password, with: "wowza_so_secure"

      click_on "Log In"

      expect(current_path).to eq("/login")
      expect(page).to have_content("Sorry, your credentials are bad.")
    end
  end
end
