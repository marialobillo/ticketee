class TicketsController < ApplicationController

  before_action :set_project

  def new
    @ticket = @project.tickets.build
  end
end
