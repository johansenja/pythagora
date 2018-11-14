class BidsController < ApplicationController
  before_action :find_bid, only: [:show, :destroy]
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
  end

  def create
    @bid = Bid.new
    @bid.developer = @developer
    @bid.buyer = @buyer
    if @job.save
      redirect_to bid_path(@bid)
    else
      render :new
    end
  end

  def destroy
    @bid.destroy
  end

  private

  def find_bid
    @bid = Bid.find(params[:id])
  end
end
