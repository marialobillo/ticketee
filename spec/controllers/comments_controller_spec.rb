require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { Factory(:confirmed_user) }
  let(:project) { Project.create(:name => "Ticketee") }

  let(:ticket) do
    ticket = project.tickets.build(:title => "State transitions",
                        description => "Can't be hacked.")
    ticket.user = user
    ticket.save
    ticket
  end

  let(state) { State.create!(:name => "New") }

  context "a user without permission to set state" do
    before do
      sign_in(:user, user)
    end

    it "cannot transition a state by passing through state_id" do
        post :create, { :comment => { :text => "Hacked!",
                                  :state_id => state.id },
                        :ticket_id => ticket.id }
                        ticket.reload <co id="ch10_1072_1" />
        ticket.state.should eql(nil)
    end


  end

end
