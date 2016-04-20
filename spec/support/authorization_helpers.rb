module AuthorizationHelpers
  def define_permession!(user, action, thing)
    Permission.create!(user: user,
                        action: action,
                        thing: thing)
  end
end
