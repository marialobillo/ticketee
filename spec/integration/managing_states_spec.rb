require 'spec_helper'

feature 'Managin states' do

  before do
    load Rails.root + "db/seed.rb"
    sign_in_as!(Factory(:admin_user))
  end

  scenario "Marking a state as default" do
    visit "/"
    click_link "Admin"
    click_link "States"
    within state_line_for("New") do <co id="ch10_740_1"/>
      click_link "Make Default"
    end

    page.should have_content("New is now the default state.")
  end
end
