# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for wines' do
  it 'routes GET /wines to the wines#index action' do
    # check that a get request to /articles maps the routes to the index method
    # in the articles controller
    expect(get('/wines')).to route_to('wines#index')
    expect(get: '/wines').to route_to(controller: 'wines', action: 'index')
  end

  it 'routes GET /wines/:id to the wines#show action' do
    # check that a get request to /articles/:id maps to the show action
    # in the articles controller, with the ID that came in the request
    expect(get('/wines/1')).to route_to(
      controller: 'wines',
      action: 'show',
      id: '1'
    )
  end

  it 'routes DELETE /wines/:id to the wines#destroy action' do
    # check that a delete request to /articles/:id maps to the destroy
    # action in the articles controller, with the ID that came in the request
    expect(delete('/wines/1')).to route_to(
      controller: 'wines',
      action: 'destroy',
      id: '1'
    )
  end

  it 'routes PATCH /wines/:id to the wines#destroy action' do
    # check that a patch request to /articles/:id maps to the patch
    # action in the articles controller, with the ID that came in the request
    expect(patch('/wines/1')).to route_to(
      controller: 'wines',
      action: 'update',
      id: '1'
    )
  end

  it 'routes POST /wines to the wines#create action' do
    # check that a post request to /articles maps to the post
    # action in the wines controller
    expect(post('/wines')).to route_to('wines#create')
  end
end
