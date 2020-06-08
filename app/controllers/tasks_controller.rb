class TasksController < ApplicationController
  before_action :set_user
  def new
    @task = Task.new
  end
  def create
    @task = @user.tasks.new(task_params)
   if @task.save
    flash[:success] = "タスクを新規作成しました。"
    redirect_to user_tasks_url @user
   else
     render :new
   end
  end
  
  def index 
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url @user
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def task_params
    params.require(:task).permit(:name,:description,)
  end
  
end