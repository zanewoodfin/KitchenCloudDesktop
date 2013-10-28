class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :prep_header_form

protected

  def prep_header_form
    @session_form = SessionForm.new
  end

  def require_login
    redirect_to root_path unless signed_in?
  end
end
