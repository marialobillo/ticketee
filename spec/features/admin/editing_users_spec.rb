require 'spec_helper'

feature 'Editing a user' do

   let!(:admin_user) { FactoryGirl.create(:admin_user) }
   let!(:user) { FactoryGirl.create(:user) }

   before do
     sign_in_as!(admin_user)
     visit '/'
     click_link "Admin"
     click_link "Users"
     click_link user.email
     click_link "Edit User"
   end
end
