require 'spec_helper'

feature 'Deleting users' do
  let!(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }

  before do
    sign_in_as! (admin_user)
    visit '/'

    click_link 'Admin'
    click_link 'Users'
  end
end
