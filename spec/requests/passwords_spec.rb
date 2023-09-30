require "rails_helper"

RSpec.describe "Passwords", type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET show" do
    it "succeeds" do
      get password_path(user)
      expect(response).to be_successful
    end
  end

  describe "PUT update" do
    it "succeeds" do
      user.update! password: "passwords321"
      put password_path(user), params: {
        password: {
          password: "123password"
        }
      }
      expect(user.reload.valid_password?("123password")).to eq(true)
      expect(user.reload.valid_password?("123paword")).to eq(false)
      expect(response).to be_redirect
    end
  end
end
