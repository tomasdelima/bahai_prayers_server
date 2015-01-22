class PrayersController < ApplicationController
  def index
    render json: Prayer.all.to_json
  end
end
