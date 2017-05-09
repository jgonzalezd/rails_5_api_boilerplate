require "rails_helper"

describe "User logs in" do
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
    it "authenticates successfully" do
      post user_session_path, params: correct_params, headers: headers
      expect(response).to have_http_status(:created)
      expect(response).to have_header('Authorization')
    end
  end
end
