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

  private

  def tasklist_params
    params.require(:tasklist).permit(:title)
  end
end
