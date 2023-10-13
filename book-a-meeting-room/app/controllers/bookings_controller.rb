class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    bookings = current_user.bookings
    render json: bookings, status: 200
  end

  def show
    render json: @booking, status: 200
  end

  def create
    @booking = current_user.bookings.build(booking_params)

    if @booking.save
      render json: @booking, status: 201
    else
      render json: @booking.errors, status: 422
    end
  end

  def update
    if @booking.update(booking_params)
      render json: @booking, status: 200
    else
      render json: @booking.errors, status: 422
    end
  end

  def destroy
    @booking.destroy
    head 204
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:meeting_room_id, :start_time, :end_time, :name, :in_charge)
  end
end
