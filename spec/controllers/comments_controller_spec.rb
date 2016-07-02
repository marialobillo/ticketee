require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { Factory(:confirmed_user) }
  let(:project) { Project.create(:name => "Ticketee") }

end
