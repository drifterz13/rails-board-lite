class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def new
    @task = Task.new
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
