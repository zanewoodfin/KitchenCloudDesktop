class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :set_user, except: [:new, :create]

  def new
    @user = User.new
    @session_form = SessionForm.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  def display_name
    respond_to do |format|
      format.js do
        if params[:display_name_option]
          @user.selected_display_name = params[:display_name_option].to_i
          @user.save
          sign_in @user
        end
      end
    end
  end

  def show
  end

  def update
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :username)
  end

  def set_user
    @user = current_user
  end

end
