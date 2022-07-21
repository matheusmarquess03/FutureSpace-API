require "rails_helper"

RSpec.describe LaunchServiceProvidersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/launch_service_providers").to route_to("launch_service_providers#index")
    end

    it "routes to #show" do
      expect(get: "/launch_service_providers/1").to route_to("launch_service_providers#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/launch_service_providers").to route_to("launch_service_providers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/launch_service_providers/1").to route_to("launch_service_providers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/launch_service_providers/1").to route_to("launch_service_providers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/launch_service_providers/1").to route_to("launch_service_providers#destroy", id: "1")
    end
  end
end
