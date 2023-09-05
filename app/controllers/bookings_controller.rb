class BookingsController < ApplicationController

  def update
    @booking = Booking.find(params[:id])


    unless @booking.user == current_user
      redirect_to :dashboard, alert: "You are not authorized to update this booking."
      return
    end

    if @booking.update(booking_params)
      redirect_to :dashboard, notice: "Booking was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def accepted
    @booking = Booking.find(params[:id])
    @booking.accepted!
    Chatroom.create(booking_id: @booking.id)
    redirect_to :dashboard
  end

  def declined
    @booking = Booking.find(params[:id])
    @booking.declined!
    redirect_to :dashboard
  end

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



  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
