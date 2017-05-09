class UnauthorizedController < ActionController::Metal
  def self.call(env)
    @respond ||= action(:respond)
    @respond.call(env)
  end

  def respond
    byebug
    self.response_body = "no entra papa!"
    self.status = :unauthorized
  end
end
