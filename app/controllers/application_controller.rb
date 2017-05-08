class ApplicationController < ActionController::API

  protected #########################  PROTECTED  ##############################
  # Validates the token and user and sets the @current_user scope
  def authenticate_request!
    if !payload || !JsonWebToken.valid_payload(payload.first)
      return invalid_authentication
    end

    load_current_user!
    invalid_authentication unless @current_user
  end

  # Returns 401 response. To handle malformed / invalid requests.
  def invalid_authentication
    render json: {error: 'Invalid Request'}, status: :unauthorized
  end

  private ############################  PRIVATE  ###############################

  def payload
    return nil unless request.headers['Authorization'].present?
    auth_header = request.headers['Authorization']
    token       = auth_header.split(' ').last
    JsonWebToken.decode(token)
  end

  # Sets the @current_user with the user_id from payload
  def load_current_user!
    #TODO: Find device by payload[0]['user_id'] && jti
    @current_user = User.find_by(id: payload[0]['user_id'])
  end
end
