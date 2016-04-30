class TicketsController < ApplicationController

  before_action :require_signin!
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authorize_create!, only: [:new, :create]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:notice] = "Ticket has not been created."
      render 'new'
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."

    redirect_to @project
  end

  private

    def set_project
      #@project = Project.find(params[:project_id])
      @project = Project.for(current_user).find(params[:project_id])
      rescue ActiveRecord::RecordNotFound
          flash[:alert] = "The project you were looking " +
                          "for could not be found."
          redirect_to root_path
      end
    end

    def ticket_params
      params.require(:ticket).permit(:title, :description)
    end

    def set_ticket
      @ticket = @project.tickets.find(params[:id])
    end

    def authorize_create!

    end

end
