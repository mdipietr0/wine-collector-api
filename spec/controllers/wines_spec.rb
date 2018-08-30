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
    it 'is successful' do
      expect(response).to be_success
    end

    it 'renders a JSON response' do
      wines_response = JSON.parse(response.body)
      expect(wines_response).not_to be_nil
      expect(wines_response.first['wine']).to eq(wine['wine'])
    end
  end

  describe 'GET show' do
    # before each test, call a get request on the controllers :show method
    before(:each) { get :show, params: { id: wine.id } }

    it 'is successful' do
      expect(response).to be_success
    end

    it 'renders a JSON response' do
      # take the JSON response, parse into a ruby object
      # we can manipulate the object and compare it to the database
      wine_response = JSON.parse(response.body)
      expect(wine_response['id']).to eq(wine['id'])
    end
  end

  describe 'DELETE destroy' do
    # before each test, call a delete request on the controllers :destroy method
    it 'is successful and returns an empty response' do
      delete :destroy, params: { id: wine.id }

      expect(response).to be_success

      expect(response.body).to be_empty

      expect(wine).to be_nil
    end
  end
  # describe 'DELETE destroy' do
  #   # before each test, call a get request on the controllers :show method
  #
  #   it 'is successful and returns an empty response' do
  #     delete :destroy, params: { id: article.id }
  #     expect(response.status).to eq(204)
  #     expect(response.body).to be_empty
  #     expect(article).to be_nil
  #   end
  # end
  #
  # describe 'PATCH update' do
  #   def article_diff
  #     { title: 'Two Stupid Tricks' }
  #   end
  #
  #   before(:each) do
  #     patch :update, params: { id: article.id, article: article_diff }
  #   end
  #
  #   it 'is successful' do
  #     expect(response).to be_success
  #   end
  #
  #   it 'renders a JSON response' do
  #     article_response = JSON.parse(response.body)
  #     expect(article_response['title']).to eq(article_diff[:title])
  #   end
  # end
  #
  # describe 'POST create' do
  #   before(:each) do
  #     post :create, params: { article: article_params }
  #   end
  #
  #   it 'is successful' do
  #     expect(response).to be_success
  #   end
  #
  #   it 'renders a JSON response' do
  #     article_response = JSON.parse(response.body)
  #     expect(article_response['title']).to eq(article_params[:title])
  #   end
  # end
end
