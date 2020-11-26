class ApplicationController < ActionController::Base
  def index
    return redirect_to new_user_session_path if current_user.nil?
    redirect_to contacts_path
  end
end
