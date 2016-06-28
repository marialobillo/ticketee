require 'spec_helper'

feature 'Managin states' do

  before do
    load Rails.root + "db/seed.rb"
    sign_in_as!(Factory(:admin_user))
  end
end
