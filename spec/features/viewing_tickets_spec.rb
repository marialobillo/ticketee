require 'spec_helper'

feature "Viewing tickets" do
  before do
    atom_2 = FactoryGirl.create(:project, name: "Atom 2")

    user = FactoryGirl.create(:user)
    ticket = FactoryGirl.create(:ticket,
          project: atom_2,
          title: "Make it shiny!",
          description: "Gradients! Starbursts! Oh my!")
    ticket.update(user: user)

    internet_explorer = FactoryGirl.create(:project,
                                          name: "Internet Explorer")

    FactoryGirl.create(:ticket,
          project: internet_explorer,
          title: "Standards compliance",
          description: "Isn't a joke.")

    sign_in_as!(user)
    visit '/'
  end

  scenario "Viewing tickets for a given project" do
    click_link "Atom 2"

    expect(page).to have_content("Make it shiny!")
    expect(page).to_not have_content("Standards compliance")

    click_link "Make it shiny!"
    whithin('#ticket h2') do
      expect(page).to have_content("Make it shiny!")
    end

    expect(page).to have_content("Gradients! Starbursts! Oh my!")
  end
end
