class TaskUsersController < ApplicationController
  def create
    @users = User.all
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @role = params[:role]
    @task_user = TaskUser.create(task: @task, user: @user, role: @role)

    respond_to do |format|
      if @task_user.save!
        format.turbo_stream { }
        format.html { redirect_to tasklists_path }
      else
        format.html { render :root, status: :unprocessable_entity }
        format.turbo_stream { flash.now[:alert] = "Something went wrong." }
      end
    end
  end

  private

  def task_users_params
    params.require(:task_users).permit(:task_id, :user_id, :role)
  end
end
