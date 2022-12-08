class TasksController < ApplicationController
  before_action :set_tasklist, only: [:show, :new, :create, :edit, :update]
  before_action :set_task, only: [:edit, :update, :destroy, :sort]

  def show
    @users = User.all
    @task = Task.includes(:task_users).find(params[:id])
  end

  def new
    @task = @tasklist.tasks.build
  end

  def edit
  end

  def create
    @task = @tasklist.tasks.build(task_params)
    @task.insert_at(1)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasklists_path }
        format.turbo_stream { flash.now[:notice] = "Task was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
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

  def sort
    @task.insert_at(sort_params[:position])

    if @task.update(sort_params)
      head :ok
    else
      redirect_to tasklists_path, status: :internal_server_error
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

  def sort_params
    params.require(:task).permit(:position, :tasklist_id)
  end
end
