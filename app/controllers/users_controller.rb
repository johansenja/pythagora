class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update]
  skip_before_action :authenticate_user!, only: [:custom_sign_in]
  def index
  end

  def show
    link_string = @user.portfolio_links
    @portfolio_links = link_string.split(',') if link_string
  end

  def update
    @user.update(user_params)
  end

  def custom_sign_in
    user = User.find_for_authentication(email: params[:user][:email])
    user&.valid_password?(params[:user][:password]) ? user : nil
    sign_in(user, scope: :user)
    @job = Job.new
    redirect_to new_job_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :tagline, :bio, :portfolio_links, :email, :photo)
  end
end
