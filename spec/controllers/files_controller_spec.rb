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

  before do
    good_user.permission.create!(action: "view", thing: project)
  end

  context "users with access" do
    before do
      sign_in(good_user)
    end

    it "can access assets in a project" do
      get 'show', id: asset.id
      expect(response.body).to eql(File.read(path))
    end
  end

end
