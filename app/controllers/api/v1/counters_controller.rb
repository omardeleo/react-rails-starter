class Api::V1::CountersController < ApplicationController
  before_action :set_counter, only: %i[ show update destroy ]

  def show
    @counter.count += 1
    @counter.save
    render json: @counter
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_counter
    @counter = Counter.all.first
  end

  # Only allow a list of trusted parameters through.
  def counter_params
    params.require(:counter).permit(:count)
  end
end