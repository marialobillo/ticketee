require 'spec_helper'

feature "Creating Users" do
  let!(:admin) { FactoryGirl.create(:admin_user) }

  before do
    sign_in_as!(admin)
    visit '/'
    click_link "Admin"
    click_link "Users"
    click_link "New User"
  end

end
