module TicketsHelper
  def state_for(comment)
    content_tag(:div, :class => "states") do
      if previous_state && comment.state != previous_state
  end

end
