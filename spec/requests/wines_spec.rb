# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Wines API' do
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

  def user_params
    {
      email: 'bob@example.com',
      password: 'foobarbaz',
      password_confirmation: 'foobarbaz'
    }
  end

  def wines
    Wine.all
  end

  def wine
    Wine.first
  end

  before(:all) do
    post '/sign-up', params: { credentials: user_params }
    post '/sign-in', params: { credentials: user_params }

    @token = JSON.parse(response.body)['user']['token']
    @user_id = JSON.parse(response.body)['user']['id']
    w = wine_params
    w[:user_id] = @user_id
    # create! is similar to create except that an exception is raised
    # instead of just failing and returning false.
    Wine.create!(w)
  end

  def headers
    {
      'HTTP_AUTHORIZATION' => "Token token=#{@token}"
    }
  end

  after(:all) do
    Wine.delete_all
  end

  describe 'GET /wines' do
    it 'lists all wines' do
      get '/wines', headers: headers

      expect(response).to be_success

      wines_response = JSON.parse(response.body)['wines']

      expect(wines_response.length).to eq(wines.count)

      expect(wines_response.first['name']).to eq(wine['name'])
    end
  end

  describe 'GET /wines/:id' do
    it 'shows one wine' do
      get "/wines/#{wine.id}", headers: headers

      expect(response).to be_success

      wine_response = JSON.parse(response.body)['wine']

      expect(wine_response['id']).to eq(wine['id'])
    end
  end

  describe 'DELETE /articles/:id' do
    # make a delete request to articles with the id of the article
    # that was created for running this test
    it 'deletes a wine' do
      delete "/wines/#{wine.id}", headers: headers

      expect(response).to be_success

      expect(response.body).to be_empty

      # ensures that the wine was actually deleted
      expect(wine).to be_nil
    end
  end

  describe 'PATCH /wines/:id' do
    def wine_diff
      { name: 'Silver Oak' }
    end

    it 'updates a wine' do
      patch "/wines/#{wine.id}", params: { wine: wine_diff }, headers: headers

      expect(response).to be_success

      wine_response = JSON.parse(response.body)['wine']

      expect(wine_response['name']).to eq(wine_diff[:name])
    end
  end

  describe 'POST /wines' do
    def new_wine
      {
        producer: 'Trimbach',
        name: 'Pinot Blanc Classic',
        country: 'France',
        region: 'Alsace',
        color: 'White'
      }
    end
    it 'creates a wine' do
      post '/wines', params: { wine: new_wine }, headers: headers

      expect(response).to be_success

      wine_response = JSON.parse(response.body)['wine']

      expect(wine_response['name']).to eq(new_wine[:name])
    end
  end
end
