class ErrorsController < ApplicationController
  def handle404
  	render :nothing => true
  end
end
