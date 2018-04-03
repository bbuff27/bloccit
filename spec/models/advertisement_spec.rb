require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:ad) { Advertisement.create!(title: "New Ad", copy: "New copy", price: 10) }

  describe "attributes" do
    it "has title, copy, and price attributes" do
      expect(ad).to have_attributes(title: "New Ad", copy: "New copy", price: 10)
    end
  end
end
