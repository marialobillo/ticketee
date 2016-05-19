require 'spec_helper'

feature "Seed Data" do
  scenario "The basics" do
    load Rails.root + "db/seeds.rb"
  end
end
