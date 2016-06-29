class State < ActiveRecord::Base

  def to_s
    name
  end

  def default!
    current_default_state = State.find_by_default(true)
    <co id="ch10_813_1"/>

    self.default = true
    self.save!

    if current_default_state <co id="ch10_813_2"/>
      current_default_state.default = false
      current_default_state.save!
    end
  end
end
