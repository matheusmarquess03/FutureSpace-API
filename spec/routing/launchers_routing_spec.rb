require "rails_helper"

RSpec.describe LaunchersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/launchers").to route_to("launchers#index")
    end

    it "routes to #show" do
      expect(get: "/launchers/1").to route_to("launchers#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/launchers").to route_to("launchers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/launchers/1").to route_to("launchers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/launchers/1").to route_to("launchers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/launchers/1").to route_to("launchers#destroy", id: "1")
    end
  end
end
