class TasksController < ApplicationController
	include ApplicationHelper
  # before_action :set_task

  def index
  	# @tasks = Task.all
		@devices = Device.where(user_id: current_user.id)
		@tasks = Task.where(user_id: current_user.id)
  end

  def show
 		@task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.device_id = params[:device_id]
    @task.status = 'Pending'

    if @task.save
    	SshCommand.ssh_new(@task.id)
			@task.get_device_id
    	SshCommand.ssh_new
    	redirect_to user_tasks_path

    else
      redirect_back(fallback_location: root_url)
    end
  end

  def new
  	@task = Task.new
		@devices = Device.where(user_id: current_user.id)
    render template: "tasks/new"
  end

  def edit
  	@task = Task.find(params[:id])
		@task.user_id = current_user.id
		@task.device_id = params[:device_id]
    render template: "tasks/edit"
  end

  def update
  	@task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to user_tasks_path(current_user.id)
      SshCommand.ssh_update(@task.id)
    else
      render '/tasks/new'
    end
  end

  def destroy
		@task = Task.find(params[:id])
    @task.destroy
    SshCommand.ssh_delete(@task.id)
    respond_to do |format|
      format.html { redirect_to user_tasks_path(current_user.id), notice: 'The Task was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def set_task
    @task = Task.find(params[:id])
  end


  def task_params
    params.require(:task).permit(:device_id, :user_id, :description, :start_date, :start_time, :end_date, :end_time, :name)
  end
end
