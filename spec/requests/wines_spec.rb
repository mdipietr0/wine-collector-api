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

  def wines
    Wine.all
  end

  def wine
    Wine.first
  end

  before(:all) do
    # create! is similar to create except that an exception is raised
    # instead of just failing and returning false.
    Wine.create!(wine_params)
  end

  after(:all) do
    Wine.delete_all
  end

  describe 'GET /wines' do
    it 'lists all wines' do
      get '/wines'

      expect(response).to be_success

      wines_response = JSON.parse(response.body)

      expect(wines_response.length).to eq(wines.count)

      expect(wines_response.first['name']).to eq(wine['name'])
    end
  end

  describe 'GET /wines/:id' do
    it 'shows one wine' do
      get "/wines/#{wine.id}"

      expect(response).to be_success

      wine_response = JSON.parse(response.body)
      expect(wine_response['id']).to eq(wine['id'])
    end
  end

  describe 'DELETE /articles/:id' do
    # make a delete request to articles with the id of the article
    # that was created for running this test
    it 'deletes a wine' do
      delete "/wines/#{wine.id}"

      expect(response).to be_success

      expect(response.body).to be_empty

      # ensures that the wine was actually deleted
      expect(wine).to be_nil
    end
  end

  # describe 'PATCH /articles/:id' do
  #   def article_diff
  #     { title: 'Two Stupid Tricks' }
  #   end
  #
  #   it 'updates an article' do
  #     patch "/articles/#{article.id}", params: { article: article_diff }
  #
  #     expect(response).to be_success
  #     article_response = JSON.parse(response.body)
  #     expect(article_response['title']).to eq(article_diff[:title])
  #   end
  # end
  #
  # describe 'POST /articles' do
  #   def new_article
  #     {
  #       title: 'Two Weird Tricks',
  #       content: 'You won\'t believe what happens next...'
  #     }
  #   end
  #   it 'creates an article' do
  #     post '/articles', params: { article: new_article }
  #
  #     expect(response).to be_success
  #     article_response = JSON.parse(response.body)
  #     expect(article_response['title']).to eq(new_article[:title])
  #   end
  # end
end
