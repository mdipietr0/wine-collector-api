# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tastings API', type: :request do
  def wine_params
    {
      producer: 'Silver Oak',
      name: 'Silver Oak',
      country: 'USA',
      region: 'Napa',
      color: 'Red'
    }
  end

  def wine_params2
    {
      producer: 'Silver Oak',
      name: 'Silver Oak',
      country: 'USA',
      region: 'Alexander',
      color: 'Red'
    }
  end

  def user_params
    {
      email: 'cathy@example.com',
      password: 'foobarbaz',
      password_confirmation: 'foobarbaz'
    }
  end

  def tastings
    Tasting.all
  end

  def tasting
    Tasting.first
  end

  def headers
    {
      'HTTP_AUTHORIZATION' => "Token token=#{@token}"
    }
  end

  before(:all) do
    post '/sign-up', params: { credentials: user_params }
    post '/sign-in', params: { credentials: user_params }

    @token = JSON.parse(response.body)['user']['token']
    @user_id = JSON.parse(response.body)['user']['id']

    post '/wines', params: { wine: wine_params }, headers: headers
    @wine_id = JSON.parse(response.body)['wine']['id']

    post '/wines', params: { wine: wine_params2 }, headers: headers
    @wine_id2 = JSON.parse(response.body)['wine']['id']

    tasting_params = {
      wine_id: @wine_id,
      user_id: @user_id,
      appearance: 'Red',
      nose: 'Fruity',
      palate: 'Bold',
      conclusions: 'Good'
    }

    # create! is similar to create except that an exception is raised
    # instead of just failing and returning false.
    Tasting.create!(tasting_params)
  end

  after(:all) do
    Tasting.delete_all
    Wine.delete_all
    User.delete_all
  end

  describe 'GET /tastings' do
    it 'gets all tastings' do
      get '/tastings', headers: headers

      expect(response).to be_success

      tastings_response = JSON.parse(response.body)['tastings']

      expect(tastings_response.length).to eq(tastings.count)

      expect(tastings_response.first['id']).to eq(tasting['id'])
    end
  end

  describe 'GET /tastings/:id' do
    it 'shows one tasting' do
      get "/tastings/#{tasting.id}", headers: headers

      expect(response).to be_success

      tasting_response = JSON.parse(response.body)['tasting']

      expect(tasting_response['id']).to eq(tasting['id'])
    end
  end

  describe 'DELETE /tastings/:id' do
    it 'deletes one tasting' do
      delete "/tastings/#{tasting.id}", headers: headers

      expect(response).to be_success

      expect(response.body).to be_empty

      expect(tasting).to be_nil
    end
  end

  describe 'PATCH /tastings/:id' do
    def tasting_diff
      {
        wine_id: @wine_id2
      }
    end
    it 'updates a tasting' do
      patch "/tastings/#{tasting.id}",
            params: { tasting: tasting_diff },
            headers: headers

      expect(response).to be_success

      tasting_response = JSON.parse(response.body)['tasting']

      expect(tasting_response['wine']['id']).to eq(@wine_id2)
    end
  end

  describe 'POST /tasting' do
    def tasting_params
      {
        user_id: @user_id,
        wine_id: @wine_id,
        appearance: 'White',
        nose: 'Floral',
        palate: 'Light',
        conclusions: 'Good'
      }
    end
    it 'creates a tasting' do
      post '/tastings', params: { tasting: tasting_params }, headers: headers

      expect(response).to be_success

      tasting_response = JSON.parse(response.body)['tasting']

      user_id = tasting_response['user']['id']

      expect(user_id).to eq(tasting_params[:user_id])
    end
  end
end
