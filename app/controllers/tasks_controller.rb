class TasksController < ApplicationController
  before_action :set_tasklist, only: [:new, :create, :edit, :update]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.ordered
  end

  def show
  end

  def new
    @task = @tasklist.tasks.build
  end

  def create
    @task = @tasklist.tasks.build(task_params)
    @task.move_to_top

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasklists_path }
        format.turbo_stream { flash.now[:notice] = "Task was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasklists_path }
        format.turbo_stream { flash.now[:notice] = "Task was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other }
      format.turbo_stream { flash.now[:notice] = "Task was successfully removed." }
    end
  end

  private

  def set_tasklist
    @tasklist = Tasklist.find(params[:tasklist_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
