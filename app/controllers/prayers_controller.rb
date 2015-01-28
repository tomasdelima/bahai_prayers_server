class PrayersController < ApplicationController
  def index
    if params[:category_id]
      prayers = Prayer.where(category_id: params[:category_id])
    else
      prayers = Prayer.all
    end
    render json: prayers.to_json
  end
end
