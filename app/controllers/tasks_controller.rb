class TasksController < ApplicationController
	include ApplicationHelper
  # before_action :set_task

  def index
  	@tasks = Task.all
  end

  def show
 		@task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.device_id = params[:device_id]

    if @task.save
      redirect_to user_tasks_path
    else
      redirect_back(fallback_location: root_url)
    end
  end

  def new
  	@task = Task.new
    render template: "tasks/new"
  end

  def edit
  	@task = Task.find(params[:id])
    render template: "tasks/edit"
  end

  def update
  	@task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path
    else
      render '/tasks/new'
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to new_task_url, notice: 'The Task was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def set_task
    @task = Task.find(params[:id])
  end


  def task_params
    params.require(:task).permit(:device_id, :user_id, :description, :start_date, :start_time, :end_date, :end_time)
  end
end
