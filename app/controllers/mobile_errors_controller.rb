class MobileErrorsController < ApplicationController
  def create
    mobile_error = MobileError.create(message: params[:message])
    respond_to do |format|
      format.json { render json: mobile_error }
    end
  end
end
