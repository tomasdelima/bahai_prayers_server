class PrayersController < ApplicationController
  def index
    prayers = Prayer.all
    prayers = prayers.where("updated_at > '#{Time.at(Integer(params[:last_updated_at])/1000)}'") if params[:last_updated_at]
    prayers = prayers.where(category_id: params[:category_id]) if params[:category_id]
    render json: prayers.to_json
  end

  def update
    Prayer.find(params[:id]).update_attributes(body: params[:body], author: params[:author])
    render json: {message: 'Oração salva com sucesso'}
  end
end
