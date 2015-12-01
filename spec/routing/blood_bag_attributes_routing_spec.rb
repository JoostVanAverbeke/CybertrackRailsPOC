require "rails_helper"

RSpec.describe BloodBagAttributesController, type: :routing do
  describe "Routing" do

    it "routes to #index" do
      expect(get: "/blood_bags/1/blood_bag_attributes").to route_to("blood_bag_attributes#index", blood_bag_id: '1')
    end

    it "routes to #graphs" do
      expect(get: "/blood_bags/1/blood_bag_attributes/graphs").to route_to("blood_bag_attributes#graphs", blood_bag_id: '1')
    end
  end
end