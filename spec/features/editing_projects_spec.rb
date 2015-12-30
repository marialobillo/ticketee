require 'spec_helper'

feature "Editing Projects" do
  scenario "Updating a project" do
    FactoryGirl.create(:project, name: "Atom 2")

    visit "/"
    click_link "Atom 2"
    click_link "Edit Project"
    fill_in "Name", with: "Atom 2 beta"
    click_button "Update Project"

    expect(page).to have_content("Project has been updated.")
  end
end
