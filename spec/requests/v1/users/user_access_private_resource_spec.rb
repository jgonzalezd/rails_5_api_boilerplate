require "rails_helper"

describe "User accesses authenticated resource" do
  let!(:user) { create(:user) }
  let (:headers) do
    {
      "ACCEPT" => "application/json"     # This is what Rails > 4 accepts
    }
  end

  let(:correct_params) do
    {
      user: {
        email:    user.email,
        password: 'password'
      }
    }
  end

  it "uses valid token" do
    post user_session_path, params: correct_params, headers: headers
    authorization_header = response.headers['Authorization']
    get hello_path, headers: headers.merge('Authorization'=> authorization_header)
    expect(json).to include_json(message: "You can access this, Yay!")
  end

end
