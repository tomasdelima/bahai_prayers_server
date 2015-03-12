class MobileErrorsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    mobile_error = MobileError.create(message: params[:message], origin: params[:origin])
    render json: mobile_error
  end
end
