require 'pry'
class TastingsController < ProtectedController
  before_action :set_tasting, only: [:show, :update, :destroy]

  # GET /tastings
  def index
    @tastings = current_user.tastings

    render json: @tastings
  end

  # GET /tastings/1
  def show
    render json: @tasting
  end

  # POST /tastings
  def create
    @tasting = current_user.tastings.new(tasting_params)

    if @tasting.save
      render json: @tasting, status: :created, location: @tasting
    else
      render json: @tasting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tastings/1
  def update
    if @tasting.update(tasting_params)
      render json: @tasting
    else
      render json: @tasting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tastings/1
  def destroy
    @tasting.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tasting
    @tasting = current_user.tastings.find(params[:id])
    # @tasting = Tasting.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tasting_params
    params.require(:tasting).permit(:user_id, :wine_id)
  end
end
