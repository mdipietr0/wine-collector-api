# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WinesController do
  def wine_params
    {
      producer: 'Chapoutier',
      name: 'Riesling Schieferkopf Lieu Dit Buehl',
      country: 'France',
      region: 'Alace',
      color: 'White',
      # type: 'Still'
    }
  end

  def wine
    Wine.first
  end

  before(:all) do
    Wine.create!(wine_params)
  end

  after(:all) do
    Wine.delete_all
  end

  describe 'GET index' do
    before(:each) { get :index }
    skip 'is successful' do
      expect(response).to be_success
    end

    skip 'renders a JSON response' do
      wines_response = JSON.parse(response.body)
      expect(wines_response).not_to be_nil
      expect(wines_response.first['wine']).to eq(wine['wine'])
    end
  end

  describe 'GET show' do
    # before each test, call a get request on the controllers :show method
    before(:each) { get :show, params: { id: wine.id } }

    skip 'is successful' do
      expect(response).to be_success
    end

    skip 'renders a JSON response' do
      # take the JSON response, parse into a ruby object
      # we can manipulate the object and compare it to the database
      wine_response = JSON.parse(response.body)
      expect(wine_response['id']).to eq(wine['id'])
    end
  end

  describe 'DELETE destroy' do
    # before each test, call a delete request on the controllers :destroy method
    skip 'is successful and returns an empty response' do
      delete :destroy, params: { id: wine.id }

      expect(response).to be_success

      expect(response.body).to be_empty

      expect(wine).to be_nil
    end
  end

  describe 'PATCH update' do
    def wine_diff
      { name: 'Silver Oak' }
    end
    before(:each) { patch :update, params: { id: wine.id, wine: wine_diff } }
    skip 'is successful' do
      expect(response).to be_success
    end

    skip 'renders a JSON response' do
      wine_response = JSON.parse(response.body)

      # check that wine was changed
      expect(wine_response['name']).to eq(wine_diff[:name])
      # NOTE when referencing hash properties, if property is stored with
      # a symbol, it must be accessed with a symbole and vice versa.
    end
  end

  describe 'POST create' do
    before(:each) { post :create, params: { wine: wine_params } }

    skip 'is successful' do
      expect(response).to be_success
    end

    skip 'renders a JSON response' do
      wine_response = JSON.parse(response.body)
      expect(wine_response['name']).to eq(wine_params[:name])
    end
  end
end
