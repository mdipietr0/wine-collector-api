# frozen_string_literal: true

# Inherit from this class to require authenticated access to all actions
class WinesController < ApplicationController
  before_action :set_wine, only: %i[show update destroy]
  # before_action :authenticate

  def index
    @wines = Wine.all

    render json: @wines
  end

  def show
    render json: @wine
  end

  def destroy
    @wine.destroy
    head :no_content
  end

  def update
    if @wine.update(wine_params)
      render json: @wine
    else
      render json: @wine.errors, status: :unprocessable_entity
    end
  end

  def set_wine
    # @wine = current_user.wines.find(params[:id])
    @wine = Wine.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def wine_params
    params.require(:wine).permit(
      :producer,
      :name,
      :country,
      :region,
      :color
    )
  end

  private :set_wine, :wine_params
end
