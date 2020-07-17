class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(ride_params[:ride_id])
    mechanic.rides << ride
    redirect_to "/mechanics/#{mechanic.id}"
  end

  private

  def ride_params
    params.permit(:ride_id)
  end
end
