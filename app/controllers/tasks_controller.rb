class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy, :edit]
  def index
    @tasks = Task.all
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if(@task.save)
      flash[:success] = '課題の生成成功！'
      redirect_to @task
    else
      flash.now[:danger] = '課題が投稿されませんでした'
      render :new
    end
  end
  
  def update
    
    if(@task.update(task_params))
      flash[:success] = '課題の更新成功！'
      redirect_to @task
    else
      flash.now[:danger] = '課題が更新されませんでした'
      render :edit
      
    end
  end
  
  def edit
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = '課題は正常に削除されました！'
    redirect_to tasks_url
  end
  
  private
  
  #strong parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end
end
