require 'rails_helper'

module Jauth
  RSpec.describe AuthToken, type: :model do
    context "associations" do
      it { should belong_to(:user) }
    end

    context "validations" do
      it { should validate_presence_of :token }
      it { should validate_presence_of :refresh_token }
    end
  end
end
