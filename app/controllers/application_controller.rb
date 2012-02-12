class ApplicationController < ActionController::Base
  helper :all
  before_filter :authenticate_user!
  protect_from_forgery
end
