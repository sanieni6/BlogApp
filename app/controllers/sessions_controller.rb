class SessionsController < ApplicationController
  def destroy
    session.delete(:current_user_id)
    flash[:notice] = 'Session have been closed successfully!'
    redirect_to root_url, status: :see_other
  end
end
