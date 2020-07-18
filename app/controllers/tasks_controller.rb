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
  
  def edit
    @task = Task.find(params[:id])
  end
  
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_path
    else
      render :edit      
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_tasks_url @user
  end

  private
  def set_user
    @user = User.find(session[:user_id])
  end
  
  def task_params
    params.require(:task).permit(:name, :description)
  end

end
