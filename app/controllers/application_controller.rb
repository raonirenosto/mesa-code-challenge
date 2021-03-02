class ApplicationController < ActionController::API
  include ExceptionHandler
  include LoginUtils
end
