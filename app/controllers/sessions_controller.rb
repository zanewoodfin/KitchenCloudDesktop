class SessionsController < ApplicationController

  def new
    redirect_to users_path if signed_in?
    @session_form = SessionForm.new
  end

  def create
    @session_form = SessionForm.new(session_params)
    if @session_form.valid?
      user = User.find_by_identifier(@session_form.identifier)
      sign_in(user) if user.try(:authenticate, @session_form.password)
    end
    redirect_to  signed_in? ? users_path : root_url
  end

  def destroy
    sign_out
    redirect_to root_url
  end

private

  def session_params
    params.require(:session_form).permit(:identifier, :password)
  end

end
