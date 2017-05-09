class Api::V1::AuthorizedController < ApplicationController

  before_action :authenticate_user!

  def hello
    render json: {message: "You can access this, Yay!"}
  end

end
