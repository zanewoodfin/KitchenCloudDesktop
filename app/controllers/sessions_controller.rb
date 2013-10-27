class SessionsController < ApplicationController

  def new
    redirect_to root_path if signed_in?
    @session_form = SessionForm.new
  end

  def create
    @session_form = SessionForm.new(session_params)
    if @session_form.valid?
      user = User.find_by_identifier(@session_form.identifier)
      sign_in(user) if user.try(:authenticate, @session_form.password)
    end
    respond_to do |format|
      format.html do
        redirect_to  signed_in? ? root_url : login_path 
      end
      format.js do
        render 'sessions/sign_in_out'
      end
    end
  end

  def destroy
    sign_out
    respond_to do |format|
      format.html do
        redirect_to root_url
      end
      format.js do
        render 'sessions/sign_in_out'
      end
    end
  end

private

  def session_params
    params.require(:session_form).permit(:identifier, :password)
  end

end
