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

# rubocop:disable Metrics/BlockLength


RSpec.describe "/api/heroes", type: :request do
  let(:valid_attributes) { attributes_for :hero }
  let(:invalid_attributes) { attributes_for :invalid_hero }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # HerosController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) { Authorization: valid_attributes[:token] }
  let(:invalid_headers) { Authorization: '123456789' }

  describe "GET /index" do
    context 'with headers' do
      it "renders a successful response" do
        hero = Hero.create! valid_attributes
        get api_heroes_url, headers: valid_headers, as: :json
        expect(response).to be_successful
        expect(json_response[0][:name]).to eq hero.name
      end
    end
    
    context 'without headers' do
      it "renders a JSON response with an unauthorized status" do
        Hero.create! valid_attributes
        get api_heroes_url, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with invalid headers' do
      it "renders a JSON response with an unauthorized status" do
        Hero.create! valid_attributes
        get api_heroes_url, headers: invalid_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      hero = Hero.create! valid_attributes
      get api_hero_url(hero), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Hero" do
        expect {
          post api_heroes_url,
               params: { hero: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Hero, :count).by(1)
      end

      it "renders a JSON response with the new hero" do
        post api_heroes_url,
             params: { hero: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Hero" do
        expect {
          post api_heroes_url,
               params: { hero: invalid_attributes }, headers: valid_headers, as: :json
        }.to change(Hero, :count).by(0)
      end

      it "renders a JSON response with errors for the new hero" do
        post api_heroes_url,
             params: { hero: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { attributes_for :hero }

      it "updates the requested hero" do
        hero = Hero.create! valid_attributes
        patch api_hero_url(hero),
              params: { hero: new_attributes }, headers: valid_headers, as: :json
        hero.reload
        expect(hero.name).to eq(new_attributes[:name])
      end

      it "renders a JSON response with the hero" do
        hero = Hero.create! valid_attributes
        patch api_hero_url(hero),
              params: { hero: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the hero" do
        hero = Hero.create! valid_attributes
        patch api_hero_url(hero),
              params: { hero: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested hero" do
      hero = Hero.create! valid_attributes
      expect {
        delete api_hero_url(hero), headers: valid_headers, as: :json
      }.to change(Hero, :count).by(-1)
    end
  end
end
