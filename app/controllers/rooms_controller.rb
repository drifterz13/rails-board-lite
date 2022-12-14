class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    @room.users << current_user

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_path }
    end
  end

  private

  def room_params
    params.require(:room).permit(:title)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
