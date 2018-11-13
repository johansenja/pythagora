class JobsController < ApplicationController
  before_action :find_job, only: %i[show update destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.buyer = current_user
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @job.update(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:name, :description, :price, :deadline, :contract_type)
  end
end
