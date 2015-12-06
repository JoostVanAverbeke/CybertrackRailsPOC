require "rails_helper"

RSpec.describe BloodBagAttributesController, type: :routing do
  describe "Routing" do
    context 'Valid routes' do
      it "routes to nested blood_bag #index" do
        expect(get: "/blood_bags/1/blood_bag_attributes").to route_to("blood_bag_attributes#index", blood_bag_id: '1')
      end

      it "routes to nested blood_bag #edit_all" do
        expect(get: "/blood_bags/1/blood_bag_attributes/edit_all").to route_to("blood_bag_attributes#edit_all", blood_bag_id: '1')
      end

      it "routes to nested blood_bag #update_all" do
        expect(put: "/blood_bags/1/blood_bag_attributes/update_all").to route_to("blood_bag_attributes#update_all", blood_bag_id: '1')
      end

    end

    context 'Invalid routes' do
      it "routes not to #index" do
        expect(get("/blood_bag_attributes")).not_to be_routable
      end

      it "routes not to #show" do
        expect(get("/blood_bag_attributes/1")).not_to be_routable
      end

      it "routes not to /blood_bags" do
        expect(get("/blood_bags")).not_to be_routable
      end

      it "routes not to /blood_bags/1" do
        expect(get("/blood_bags/1")).not_to be_routable
      end
    end
  end
end