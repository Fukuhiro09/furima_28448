require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe "#create" do
    let(:purchase)    { create(:purchase) }
    it "is valid purchase" do
      expect(purchase).to be_valid
    end
  end
end
