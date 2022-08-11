require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    describe "name" do
      let(:artist) { build(:artist, name: name) }
      let(:name) { nil }

      context "when exists" do
        let(:name) { Faker::Music.band }
        
        it { expect(artist).to be_valid }
      end

      context "when nil" do
        let(:name) { nil }

        it { expect(artist).not_to be_valid }
      end

      context "when blank" do
        let(:name) { "" }

        it { expect(artist).not_to be_valid }
      end

      context "when empty" do
        let(:name) { " " }

        it { expect(artist).not_to be_valid }
      end
    end
  end
end
