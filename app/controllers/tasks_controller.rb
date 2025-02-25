class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    @tasks.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to tasks_path
  end

  # def create
  #   @tasks = Task.new(task_params)
  #   @tasks.save
  # end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
