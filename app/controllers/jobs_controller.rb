class JobsController < ApplicationController
  before_action :find_job, only: %i[show update destroy assign_job]
  skip_before_action :authenticate_user!, only: [:index, :new, :custom_submit_path]

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

  def dashboard
    # buyer side
    @all_jobs = Job.where(buyer_id: current_user.id)
    @open_jobs = Job.where(developer_id: nil, buyer_id: current_user.id, completed: false)
    @closed_jobs = Job.where(completed: true, buyer_id: current_user.id)
    @active_jobs = Job.where(buyer_id: current_user.id).select { |job| job.developer != nil }

    # developer side
    @dev_jobs = Job.where(developer_id: current_user.id)
    @current_dev_jobs = Job.where(developer_id: current_user.id, completed: false)
    @bids = Bid.where(developer_id: current_user.id)
    @open_bids = Bid.where(developer_id: current_user.id, successful: nil)
    @unsucc_bids = Bid.where(developer_id: current_user.id, successful: false)
  end

  def custom_submit_path
    flash[:name] = params[:job][:name]
    flash[:timeline] = params[:job][:deadline]
    flash[:budget] = params[:job][:price]
    flash[:contract] = params[:job][:contract_type]
    flash[:description] = params[:job][:description]
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
