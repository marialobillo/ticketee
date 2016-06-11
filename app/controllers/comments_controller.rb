class CommentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_ticket
end
