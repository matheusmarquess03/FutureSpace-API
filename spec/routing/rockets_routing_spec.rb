require "rails_helper"

RSpec.describe RocketsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rockets").to route_to("rockets#index")
    end

    it "routes to #show" do
      expect(get: "/rockets/1").to route_to("rockets#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/rockets").to route_to("rockets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/rockets/1").to route_to("rockets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/rockets/1").to route_to("rockets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/rockets/1").to route_to("rockets#destroy", id: "1")
    end
  end
end
