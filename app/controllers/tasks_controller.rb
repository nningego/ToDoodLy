class TasksController < ApplicationController
  respond_to :html, :xml, :js

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(params[:task])
    if @task.save
      flash[:notice] = "Added new task !"
      redirect_to list_url(@list)
    else
      flash[:error] = "Failed to create new task !"
      redirect_to list_url(@list)
    end
  end

  def completed
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to list_url(@list)
  end
end
