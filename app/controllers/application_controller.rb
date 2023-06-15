class ApplicationController < ActionController::Base
  # return the first user from the database
  def current_user
    User.first
  end
end
