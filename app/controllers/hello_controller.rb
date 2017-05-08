class HelloController < ApplicationController
  before_action :authenticate_request!

  def say_hello
    render json: { response: 'accessed successfully' }, status: :ok
  end
end
