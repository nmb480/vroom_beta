class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
end
