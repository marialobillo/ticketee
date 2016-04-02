require 'spec_helper'

feature "Creating Admin Users" do

  scenario "Creating an admin user" do
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    check "Is an admin?"
    click_button "Create User"
    expect(page).to have_content("User has been created.")
    within("#users") do
      expect(page).to have_content("admin@example.com (Admin)")
    end
  end

end
