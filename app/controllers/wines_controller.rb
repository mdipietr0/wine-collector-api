# frozen_string_literal: true

# Inherit from this class to require authenticated access to all actions
class WinesController < ApplicationController
  # before_action :authenticate

  def index
    @wines = Wine.all

    render json: @wines
  end
end
