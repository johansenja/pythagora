class BidsController < ApplicationController
  before_action :find_bid, only: [:show, :destroy]
  before_action :find_job, only: [:new_job]
  def index
    @bids = Bid.where(buyer_id: current_user.id)
  end

  def show
  end

  def new_developer
    @buyer = current_user
    @developer = User.find(params[:user_id])
    @bid = Bid.new
  end

  def new_job
    @job = Job.find(params[:job_id])
    @developer = current_user
    @buyer = @job.buyer
    @bid = Bid.new
    @bid.developer_id = @developer.id
    @bid.buyer_id = @buyer.id
    @bid.job_id = @job.id
  end

  def create
    @bid = Bid.new(bid_params)
    if @bid.save
      redirect_to job_path(@bid.job)
    else
      render :new_job
    end
  end

  def destroy
    @bid.destroy
  end

  private

  def bid_params
    params.require(:bid).permit(:developer_id, :buyer_id, :job_id)
  end

  def find_bid
    @bid = Bid.find(params[:id])
  end

  def find_job
    @job = Job.find(params[:job_id])
  end
end
