class TasksController < ApplicationController
  before_action :set_user
  def new
    @task = @user.tasks.new(task_params)
  end
  def create
    @task = @user.tasks.create(task_params)
   if @task.save
    flash[:success] = "タスク新規作成しました。"
    redirect_to user_tasks_url @user
   else
     render :new
   end
  end
  
  def index 
    @tasks = @user.tasks
  end
  
  def show
  end
  
  private
  def set_user
    @user = User.find(params[:user_id])
  end
  def task_params
    params.require(:task).permit(:name, :description, :user_id)
  end
end