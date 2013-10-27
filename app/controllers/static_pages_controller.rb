class StaticPagesController < ApplicationController
  def home
    @session_form = SessionForm.new
  end
end
