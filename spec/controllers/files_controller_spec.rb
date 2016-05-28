require 'rails_helper'

RSpec.describe FilesController, type: :controller do
  let(:good_user) { FactoryGirl.create(:user) }
  let(:bad_user) { FactoryGirl.create(:user)}

end
