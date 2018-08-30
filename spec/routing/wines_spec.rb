# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for wines' do
  it 'routes GET /wines to the wines#index action' do
    expect(get('/wines')).to route_to('wines#index')
    expect(get: '/wines').to route_to(controller: 'wines', action: 'index')
  end

  it 'routes GET /wines/:id to the wines#show action' do
    expect(get('/wines/1')).to route_to(
      controller: 'wines',
      action: 'show',
      id: '1'
    )
  end
end

#
#
#
#
#
# require 'rails_helper'
#
# RSpec.describe 'routes for articles' do
#   it 'routes GET /articles to the articles#index action' do
#     # check that a get request to /articles maps the routes to the index method
#     # in the articles controller
#     expect(get('/articles')).to route_to('articles#index')
#   end
#
#   it 'routes GET /articles/:id to the articles#show action' do
#     # check that a get request to /articles/:id maps to the show action
#     # in the articles controller, with the ID that came in the request
#     expect(get('/articles/1')).to route_to(
#       controller: 'articles',
#       action: 'show',
#       id: '1'
#     )
#   end
#
#   it 'routes DELETE /articles/:id to the articles#destroy action' do
#     # check that a delete request to /articles/:id maps to the destroy
#     # action in the articles controller, with the ID that came in the request
#     expect(delete('/articles/1')).to route_to(
#       controller: 'articles',
#       action: 'destroy',
#       id: '1'
#     )
#   end
#
#   it 'routes PATCH /articles/:id to the articles#update action' do
#     # check that a patch request to /articles/:id maps to the patch
#     # action in the articles controller, with the ID that came in the request
#     expect(patch('/articles/1')).to route_to(
#       controller: 'articles',
#       action: 'update',
#       id: '1'
#     )
#   end
#
#   it 'routes POST /articles to the articles#create action' do
#     expect(post('/articles')).to route_to('articles#create')
#   end
# end
