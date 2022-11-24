class DndsController < ApplicationController
  def sort
    @task = Task.find(params[:id])
    @task.insert_at(dnd_params[:position])

    if @task.update(dnd_params)
      head :ok
    else
      redirect_to tasklists_path, status: :internal_server_error
    end
  end

  private

  def dnd_params
    params.require(:dnd).permit(:position, :tasklist_id)
  end
end
