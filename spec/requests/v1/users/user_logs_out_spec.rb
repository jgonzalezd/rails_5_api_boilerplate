require "rails_helper"

describe "User logs out" do
  let!(:user) { create(:user) }
  let (:headers) do
    {
      "ACCEPT" => "application/json"     # This is what Rails > 4 accepts
    }
  end

  context "with correct credentials" do
    let(:correct_params) do
      {
        user: {
          email:    user.email,
          password: 'password'
        }
      }
    end

    it "successfully" do
      post user_session_path, params: correct_params, headers: headers
      authorization_header = response.headers['Authorization']

      get hello_path, headers: headers.merge('Authorization'=> authorization_header)
      expect(json).to include_json(message: "You can access this, Yay!")

      delete destroy_user_session_path, headers: headers.merge('Authorization'=> authorization_header)
      expect(response).to have_http_status(:no_content)

      get hello_path, headers: headers.merge('Authorization'=> authorization_header)
      expect(response).not_to have_header('Authorization')
      expect(json).not_to     include_json(message: "You can access this, Yay!")
      expect(json).to         include_json(error:   "You dont have authorization to access this resource")
    end
  end
end
