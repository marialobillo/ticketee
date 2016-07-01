require 'spec_helper'

feature "Creating states" do

  scenario "Changing states for a ticket" do
    check_permission_box "view", project
    check_permission_box "change_states", project
    click_button "Update"
    click_button "Sign out"
    sign_in_as!(user)
    click_link project.name
    click_link ticket.title
    fill_in "Text", :with => "Opening this ticket."
    select "Open", :from => "State"
    click_button "Create Comment"
    page.should have_content("Comment has been created.")
    within("#ticket .state") do
      page.should have_content("Open")
    end
  end
end
