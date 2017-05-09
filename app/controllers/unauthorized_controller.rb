class UnauthorizedController < ActionController::Metal
  def self.call(env)
    @respond ||= action(:respond)
    @respond.call(env)
  end

  def respond
    self.response_body = {"error"=> "You dont have authorization to access this resource"}.to_json
    self.status = :unauthorized
  end
end
