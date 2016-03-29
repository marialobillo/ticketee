require 'spec_helper'

feature "Creating Users" do
  let!(:admin) { FactoryGirl.create(:admin_user) }

end
