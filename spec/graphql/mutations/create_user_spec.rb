require "rails_helper"

module Mutations
  RSpec.describe CreateUser, type: :request do
    describe ".resolve" do
      def perform(args = {})
        Mutations;;CreateUser.new(
          object: nil,
          field: nil,
          context: {}
        ).resolve(**args)
      end

      it "creates new user" do
        user = perform(
          name: "Test User",
          auth_provider: {
            credentials: {
              email: "test@example.com",
              password: "[filtered]"
            }
          }
        )

        expect(user.persisted?).to be true
        expect(user.name).to eq "Test User"
        expect(user.email).to eq "test@example.com"
      end
    end
  end
end
