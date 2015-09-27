class UsersController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.update_attributes(:updated_password => true)
        format.html { redirect_to '/', notice: 'Your password has been changed.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def new
    @user = User.new
  end

  def edit
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
end