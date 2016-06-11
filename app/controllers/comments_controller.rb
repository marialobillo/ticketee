class CommentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_ticket

  def create
    @comment = @ticket.comments.build(params[:comment])
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to [@ticket.project, @ticket] <co id="ch10_v2_5_1" />
    else
      flash[:alert] = "Comment has not been created."
      render :template => "tickets/show" <co id="ch10_v2_5_2" />
    end
  end

  private

    def find_ticket
      @ticket = Ticket.find(params[:ticket_id])
    end
end
