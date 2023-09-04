class BookingsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @booking = Booking.new
  end

  def create
    dates = params[:booking][:date].split(", ")
    dates.each do |date|
      @booking = Booking.new(date: date)
      @recipe = Recipe.find(params[:recipe_id])
      @booking.recipe = @recipe
      @booking.user = current_user
      @booking.status = 0
      if !@booking.save
        render :index, status: :unprocessable_entity
      end
    end
    redirect_to recipes_path, notice: "Booking was successfully created."
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.accepted
      @chatroom = Chatroom.create(booking_id: @booking.id)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
