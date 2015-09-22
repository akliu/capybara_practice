require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  given(:user) { create(:user) }

  scenario "has a new user page" do
    visit new_user_url

    expect(page).to have_content "New user"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', :with => user.username
      fill_in 'password', :with => user.password
      click_on "Create User"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content user.username
    end

  end

end

feature "logging in" do
  given(:user) { create(:user) }

  before(:each) do
    visit new_user_url
    fill_in 'username', :with => user.username
    fill_in 'password', :with => user.password
    click_on "Create User"
    visit new_session_url
    fill_in 'username', :with => user.username
    fill_in 'password', :with => user.password
    click_on "Sign In"
  end

  scenario "shows username on the homepage after login" do
    expect(page).to have_content user.username
  end


end

feature "logging out" do
  given(:user) { create(:user) }

  before(:each) do
    visit new_user_url
    fill_in 'username', :with => user.username
    fill_in 'password', :with => user.password
    click_on "Create User"
    click_button "Log Out"
  end

  scenario "begins with logged out state" do
    expect(page).to have_content "Sign In"
  end

  scenario "doesn't show username on the homepage after logout" do
    expect(page).to_not have_content user.username
  end

end
