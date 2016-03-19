module ApplicationHelper

  def admmins_only(&block)
    block.call if current_user.try(:admin?)
  end
end
