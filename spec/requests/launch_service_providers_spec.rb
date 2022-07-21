require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/launch_service_providers", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # LaunchServiceProvider. As you add validations to LaunchServiceProvider, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # LaunchServiceProvidersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      LaunchServiceProvider.create! valid_attributes
      get launch_service_providers_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      launch_service_provider = LaunchServiceProvider.create! valid_attributes
      get launch_service_provider_url(launch_service_provider), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new LaunchServiceProvider" do
        expect {
          post launch_service_providers_url,
               params: { launch_service_provider: valid_attributes }, headers: valid_headers, as: :json
        }.to change(LaunchServiceProvider, :count).by(1)
      end

      it "renders a JSON response with the new launch_service_provider" do
        post launch_service_providers_url,
             params: { launch_service_provider: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new LaunchServiceProvider" do
        expect {
          post launch_service_providers_url,
               params: { launch_service_provider: invalid_attributes }, as: :json
        }.to change(LaunchServiceProvider, :count).by(0)
      end

      it "renders a JSON response with errors for the new launch_service_provider" do
        post launch_service_providers_url,
             params: { launch_service_provider: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested launch_service_provider" do
        launch_service_provider = LaunchServiceProvider.create! valid_attributes
        patch launch_service_provider_url(launch_service_provider),
              params: { launch_service_provider: new_attributes }, headers: valid_headers, as: :json
        launch_service_provider.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the launch_service_provider" do
        launch_service_provider = LaunchServiceProvider.create! valid_attributes
        patch launch_service_provider_url(launch_service_provider),
              params: { launch_service_provider: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the launch_service_provider" do
        launch_service_provider = LaunchServiceProvider.create! valid_attributes
        patch launch_service_provider_url(launch_service_provider),
              params: { launch_service_provider: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested launch_service_provider" do
      launch_service_provider = LaunchServiceProvider.create! valid_attributes
      expect {
        delete launch_service_provider_url(launch_service_provider), headers: valid_headers, as: :json
      }.to change(LaunchServiceProvider, :count).by(-1)
    end
  end
end
