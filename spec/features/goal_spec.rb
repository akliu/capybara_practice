require 'spec_helper'
require 'rails_helper'

feature "goal's index page" do
  given(:user) { create(:user) }

  before(:each) do
    visit new_user_url
    fill_in 'username', :with => user.username
    fill_in 'password', :with => user.password
    click_on 'Create User'

    click_on 'Add Goal'
    fill_in 'Goal', :with => "My first goal"
    choose 'Public'
    click_button 'Create Goal'
  end

  scenario "lists all goals of all users" do
    visit goals_url
    expect(page).to have_content("My first goal")
    expect(page).to have_content("Goals")
    expect(page).to have_link("Add Goal")
  end
end

feature "goal's show page" do
  given(:user) { create(:user) }

  before(:each) do
    visit new_user_url
    fill_in 'username', :with => user.username
    fill_in 'password', :with => user.password
    click_on 'Create User'
    click_on 'Add Goal'
    fill_in 'Goal', :with => "My first goal"
    choose 'Public'
    click_button 'Create Goal'
  end

  scenario "shows goal" do
    expect(page).to have_content("My first goal")
    expect(page).to have_link("Goals")
    expect(page).to have_link("Edit Goal")
    expect(page).to have_button("Remove Goal")
  end

  scenario "edit goal" do
    click_link 'Edit Goal'
    expect(page).to have_field("Goal")
    expect(page).to have_field("Private")
    expect(page).to have_field("Public")
    expect(page).to have_button("Update Goal")

    fill_in 'Goal', :with => "My edited goal"
    click_button 'Update Goal'
    expect(page).to have_content("My edited goal")
    expect(page).to have_link("Goals")
    expect(page).to have_link("Edit Goal")
    expect(page).to have_button("Remove Goal")
  end

  scenario "remove goal button deletes goal" do
    click_button 'Remove Goal'
    expect(page).not_to have_content("My first goal")
  end
end

feature "goals' new page" do
  given(:user) { create(:user) }

  before(:each) do
    visit new_user_url
    fill_in 'username', :with => user.username
    fill_in 'password', :with => user.password
    click_on 'Create User'
    click_on 'Add Goal'
  end

  scenario "has fields" do
    expect(page).to have_field("Goal")
    expect(page).to have_field("Private")
    expect(page).to have_field("Public")
    expect(page).to have_button("Create Goal")
  end



end
