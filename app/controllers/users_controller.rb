class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update]

  def index
  end

  def show
    link_string = @user.portfolio_links
    @portfolio_links = link_string.split(',') if link_string
  end

  def update
    @user.update(user_params)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :tagline, :bio, :portfolio_links, :email, :photo)
  end
end
