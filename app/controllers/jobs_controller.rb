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
  end

  def edit
  end

  def update
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
