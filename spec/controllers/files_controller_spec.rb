require 'rails_helper'

RSpec.describe FilesController, type: :controller do
  let(:good_user) { FactoryGirl.create(:user) }
  let(:bad_user) { FactoryGirl.create(:user)}

  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, project: project, user: good_user) }

  let(:path) { Rails.root + 'spec/fixtures/speed.txt' }
  let(:asset) do
    ticket.assets.create(asset: File.open(path))
  end

end
