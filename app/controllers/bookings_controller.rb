class BookingsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @recipe = Recipe.find(params[:recipe_id])
    @booking.recipe = @recipe
    @booking.user = current_user
    if @booking.save
      redirect_to recipes_path, notice: "Booking was successfully created."
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
