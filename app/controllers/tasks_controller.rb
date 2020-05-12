class TasksController < ApplicationController
  before_action :task_params, only: [:create, :update]
  before_action :task_find, only: [:show, :edit, :update]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to index_path
  end

  def show
    @task = task_find
  end

  def edit
    @task = task_find
  end

  def update
    @task = task_find
    @task.update(task_params)

    redirect_to index_path
  end

  def destroy
    @task = task_find
    @task.destroy
    redirect_to index_path
  end

  private

  ## Strong Params
  def task_find
    Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
