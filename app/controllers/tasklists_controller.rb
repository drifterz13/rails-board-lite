class TasklistsController < ApplicationController
  before_action :set_tasklist, only: [:edit, :update, :destroy]

  def index
    @tasklists = Tasklist.all
  end

  def new
    @tasklist = Tasklist.new
  end

  def create
    @tasklist = Tasklist.new(tasklist_params)

    respond_to do |format|
      if @tasklist.save
        format.html { redirect_to root_path }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @tasklist.update(tasklist_params)
        format.html { redirect_to root_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tasklist.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@tasklist) }
      format.html { redirect_to tasklists_path, status: :see_other }
    end
  end

  private

  def set_tasklist
    @tasklist = Tasklist.find(params[:id])
  end

  def tasklist_params
    params.require(:tasklist).permit(:title)
  end
end
