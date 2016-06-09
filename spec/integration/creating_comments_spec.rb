require 'spec_helper'

feature "Creating comments" do
  let!(:user) { Factory(:confirmed_user) }
  let!(:project) { Factory(:project) }
  let!(:ticket) { Factory(:ticket, :project => project, :user => user) }
end
