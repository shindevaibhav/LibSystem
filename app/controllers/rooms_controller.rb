class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:search]
  include SessionsHelper
  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def search


    #{"slot_start"=>"1000-01-01 00:00:00 -0456", "room_id"=>"1", "member_id"=>"1"}

    newparams = params[:params]

    @rooms = query = Room.all
    if(newparams[:room_number] != "all")
      @rooms = query.where(room_number: newparams[:room_number])
    end
    if(newparams[:size] != "all")
      @rooms = query.where( size: newparams[:size] );
    end
    if(newparams[:building] != "all")
      @rooms = query.where(building: newparams[:building]);
    end
    if(newparams[:status] != "all")
      debugger
      rooms = Booking.where(slot_start: (Time.now - 3.hours)..Time.now).select(:room_id).distinct
      rooms = rooms.collect{|x| x.room_id}
      @rooms = query.where.not(building: rooms);
    end


    if(@rooms == nil)
      @rooms = []
    end

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

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def is_member_viewing_this?
    @memberViewing  = false
    if(current_member)
      @memberViewing  = true
    end
  end

  def is_admin_viewing_this?
    @adminViewing  = false
    if(current_admin)
      @adminViewing  = true
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      logger.fatal "#{params}"
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:room_number, :size, :building)
    end
end
