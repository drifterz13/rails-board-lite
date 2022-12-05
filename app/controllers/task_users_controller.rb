class TaskUsersController < ApplicationController
  def update
    @task_user = TaskUser.find_or_initialize_by(task_id: params[:task_id], user_id: params[:user_id])
    @task_user.role = params[:role]

    @task = Task.includes(:task_users).find(params[:task_id])
    @task_users = @task.task_users
    @users = User.all

    respond_to do |format|
      if @task_user.save!
        format.turbo_stream { }
        format.html { redirect_to tasklists_path }
      else
        format.html { render :root, status: :unprocessable_entity }
        format.turbo_stream { flash.now[:alert] = "Fail to update task user." }
      end
    end
  end

  private

  def task_users_params
    params.require(:task_users).permit(:task_id, :user_id, :role)
  end
end
