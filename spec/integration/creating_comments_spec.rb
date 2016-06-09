require 'spec_helper'

feature "Creating comments" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:project) { Factory(:project) }
  let!(:ticket) { Factory(:ticket, :project => project, :user => user) }

  before do
    define_permission!(user, "view", project)

    sign_in_as!(user)
    visit '/'
    click_link project.name
  end
end
