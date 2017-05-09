require "rails_helper"

describe "User registration" do
  let(:generic_registration_params) do
    {
      user: {
        email: "test@example.com",
        password: "anewpassword",
        password_confirmation: "anewpassword"
      }
    }
  end

  let (:headers) do
    {
      "ACCEPT" => "application/json"     # This is what Rails > 4 accepts
    }
  end

  context 'JWT user with JTI matcher revocation' do
    it "creates a user when passing correct body" do
      expect(User.count).to eq(0)
      post user_registration_path, params: generic_registration_params, headers: headers
      expect(response).to have_http_status(:created)
      expect(response).to have_header('Authorization')
      expect(User.count).to eq(1)
    end
  end
end
