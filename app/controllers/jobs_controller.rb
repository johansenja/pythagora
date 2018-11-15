class JobsController < ApplicationController
  before_action :find_job, only: %i[show update destroy assign_job]
  skip_before_action :authenticate_user!, only: [:index, :new]

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
      redirect_to job_path(@job)
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

  def buyer_jobs
    @jobs = Job.where(buyer_id: current_user.id)
  end

  def developer_jobs
  end

  def assign_job
    @bid = Bid.find(params[:bid][:id])
    @developer = @bid.developer
    @job.developer = @developer
    @job.save
    @bid.successful = true
    @bid.save
    lost_bids = @job.bids.reject { |bid| bid == @bid }
    lost_bids.each do |bid|
      bid.successful = false
      bid.save
    end
    redirect_to job_path(@job)
  end

  private

  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:name, :description, :price, :deadline, :contract_type)
  end
end
