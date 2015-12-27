require 'spec_helper'

feature "Viewing projects" do
  scenario "Listing all projects" do
    project = FactoryGirl.create(:project, name: "Atom 1")
    visit '/'
    click_link 'Atom 2'
    expect(page.current_url).to eql(project_url(project))
  end
end
