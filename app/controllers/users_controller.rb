class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    link_string = @user.portfolio_links
    @portfolio_links = link_string.split(',') if link_string
  end

  def show
  end
end
