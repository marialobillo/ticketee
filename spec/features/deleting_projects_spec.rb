require 'spec_helper'

feature "Deleting projects" do

  scenario "Deleting a project" do
    FactoryGirl.create(:project, name: "Atom 2")

    visit "/"
    click_link "Atom 2"
    click_link "Delete Project"

    expec(page).to have_content("Project has been destroyed.")

    visit "/"

    expect(page).to have_no_content("Atom 2")
  end
end
