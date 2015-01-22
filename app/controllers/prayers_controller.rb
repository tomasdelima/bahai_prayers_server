class PrayersController < ApplicationController
  def index
    render json: Prayer.where(category_id: params[:category_id]).to_json
  end
end
