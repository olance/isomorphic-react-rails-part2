class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :init_application_state

  protected
  def init_application_state
    @application_state = ActiveSupport::HashWithIndifferentAccess.new
    @application_state[:path] = request.fullpath
  end
end
