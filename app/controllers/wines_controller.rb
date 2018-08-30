# frozen_string_literal: true

# Inherit from this class to require authenticated access to all actions
class WinesController < ApplicationController
  # before_action :authenticate

  def index
    @wines = Wine.all

    render json: @wines
  end

  def show
    render json: Wine.find(params[:id])
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    head :no_content
  end
end
