require "rails_helper"

RSpec.describe "Accounts", type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET show" do
    it "succeeds" do
      get account_path(user)
      expect(response).to be_successful
    end
  end

  describe "PUT update" do
    it "succeeds" do
      user.update! email: "test@mail.com"
      put account_path(user), params: {
        account: {
          email: "esta@gmail.com"
        }
      }
      expect(user.reload.email).to eq("esta@gmail.com")
      expect(response).to be_redirect
    end
  end
end
