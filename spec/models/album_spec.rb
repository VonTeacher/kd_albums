require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "validations" do
    describe "title" do
      let(:album) { build(:album, title: title, artist: artist) }
      let(:artist) { create(:artist) }
      let(:title) { nil }

      context "when exists" do
        let(:title) { "TEST ALBUM" }

        it { expect(album).to be_valid }
      end

      context "when duplicate for an artist" do
        let!(:existing_album) { create(:album, title: title, artist: artist) }
        let(:duplicate_album) { build(:album, title: title, artist: artist) }
        let(:title) { "TEST ALBUM" }

        it { expect(duplicate_album).not_to be_valid }
      end

      context "when nil" do
        let(:title) { nil }

        it { expect(album).not_to be_valid }
      end

      context "when blank" do
        let(:title) { "" }

        it { expect(album).not_to be_valid }
      end

      context "when empty" do
        let(:title) { " " }

        it { expect(album).not_to be_valid }
      end
    end
  end
end
