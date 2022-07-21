require "rails_helper"

RSpec.describe PadsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pads").to route_to("pads#index")
    end

    it "routes to #show" do
      expect(get: "/pads/1").to route_to("pads#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/pads").to route_to("pads#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/pads/1").to route_to("pads#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pads/1").to route_to("pads#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pads/1").to route_to("pads#destroy", id: "1")
    end
  end
end
