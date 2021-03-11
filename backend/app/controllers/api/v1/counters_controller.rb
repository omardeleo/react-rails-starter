require 'date'

class Api::V1::CountersController < ApplicationController
  before_action :set_counter

  def show
    if @counter
      @counter.count += 1
      @counter.save
    else
      @counter = Counter.create(count: 1)
    end
    response = "Rails server running on port 8080. Pinged #{@counter.count} #{@counter.count == 1 ? "time" : "times"}, most recently on #{DateTime.now().strftime("%a, %e %b %Y %H:%M:%S %z")}."
    render json: {response: response}
  end

  def reset
    @counter.count = 0
    @counter.save
    render json: {response: @counter.count}
  end

  private
  def set_counter
    @counter = Counter.all.first
  end

  def counter_params
    params.require(:counter).permit(:count)
  end
end