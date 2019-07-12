class ApplicationController < ActionController::API
  helper JsonHelper

  # Always return JSON regardless of requested format:
  before_action { request.format = :json }
end
