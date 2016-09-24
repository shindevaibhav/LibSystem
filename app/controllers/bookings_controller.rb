class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  include SessionsHelper
  # GET /bookings
  # GET /bookings.json
  def index
    set_search_params
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
=begin
    is_admin_viewing_this?
    is_member_viewing_this?
=end
  end

  # GET /bookings/1/edit
  def edit
=begin
    is_admin_viewing_this?
    is_member_viewing_this?
=end
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

=begin
  def is_member_viewing_this?
    @memberViewing  = false
    if(current_member != nil)
      @memberViewing  = true
    end
  end

  def is_admin_viewing_this?
    @adminViewing  = false
    debugger
    if(current_admin != nil)
      @adminViewing  = true
    end
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_search_params
      #logger.fatal "#{params[]}"
      if(params[:room] != nil)
        room_id = params[:room]

        #@bookings = Booking.find_by(room_id: room_id)

      end
  end
  # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:date, :slot_start)
    end
end


