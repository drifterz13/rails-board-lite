class TasklistsController < ApplicationController
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
      else
        format.html { redirect_to :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @tasklist = Tasklist.find(params[:id])
  end

  def update
    @tasklist = Tasklist.find(params[:id])

    respond_to do |format|
      if @tasklist.update(tasklist_params)
        format.html { redirect_to root_path }
      else
        format.html { redirect_to :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def tasklist_params
    params.require(:tasklist).permit(:title)
  end
end
