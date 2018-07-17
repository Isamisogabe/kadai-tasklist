class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :update, :destroy, :edit]
    
  def index
    @tasks = Task.all.page(params[:page]).per(5)
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    
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
      render 'edit_task_path'
      
    end
  end
  
  def edit
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = '課題は正常に削除されました！'
    redirect_to root_url
  end
  
  private
  
  #strong parameter
  def task_params
    params.require(:task).permit(:content, :status, :user_id)
  end
  
  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
