class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:search]
  include SessionsHelper
  # GET /bookings
  # GET /bookings.json
  def index
    set_search_params
    #@bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new

    @booking = Booking.new
    #set_whos_booking
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
    #Time.zone='Eastern Time (US & Canada)'
    @booking = Booking.new(booking_params)
    temp = @booking[:date]
    @booking[:slot_start] = @booking[:slot_start].change(year:temp.year, day:temp.day, month:temp.month)
    #debugger
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

  def search

    #debugger
    #{"slot_start"=>"1000-01-01 00:00:00 -0456", "room_id"=>"1", "member_id"=>"1"}
    newparams = params[:params]

    @bookings = query = Booking.all

    temp = Date.new(newparams["date(1i)"].to_i, newparams["date(2i)"].to_i,newparams["date(3i)"].to_i)

    if(newparams[:slot_start] != "all")
      slot_start = DateTime.parse(newparams[:slot_start])
      newparams[:slot_start] = slot_start.change(year:temp.year, day:temp.day, month:temp.month)
      @bookings = query.where(slot_start: newparams[slot_start])
    end
    if(newparams[:room_id] != "all")
      @bookings = query.where( room_id: newparams[:room_id] );
    end
    if(newparams[:member_id] != "all")
      @bookings = query.where(member_id: newparams[:member_id]);
    end




    @bookings = @bookings.where(date: temp)

=begin

    key= params[:search][:keyword]
    unfiltered_books = Book.lookup(key)
    @books = unfiltered_books
    unless params[:search][:checked_out] == "all"
      @books = unfiltered_books.select {|b| b.checked_out.to_s == params[:search][:checked_out]}
    end
    @search_params = {}
    @search_params[:keyword] = params[:search][:keyword]
    @search_params[:checked_out] = params[:search][:checked_out]

=end
    #@bookings = Booking.all
    render 'index'
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

=begin
    def set_whos_booking
      if member_logged_in?
        debugger
        @booking[:member_id] = current_member.id
      end
    end
=end
    def set_search_params
      #logger.fatal "#{params[]}"

      if(params[:room] != nil)
        room_id = params[:room]
        @bookings = Booking.where(room_id: room_id)
      else if(params[:memeber] != nil)
          member_id = params[:member]
          @bookings = Booking.where(member_id: member_id)
           else
            @bookings = Booking.all
           end
      end
  end
  # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:date, :slot_start, :room_id, :member_id)
    end
end


