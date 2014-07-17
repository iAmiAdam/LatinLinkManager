class UsersController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update]

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Manager created."
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	if @user.update_attributes(user_params)
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	User.find_by(:name, params[:name])
  	flash[:success] = "Manager deleted."
  	redirect_to allmanagers_path
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(root_url) unless current_user?(@user)
  end

  def already_signed_in
  	if signed_in?
  		redirect_to root_url
  	end
  end

  def signed_in_user
  	redirect_to root_url, notice: "Please Sign in." unless signed_in?
  end
end
