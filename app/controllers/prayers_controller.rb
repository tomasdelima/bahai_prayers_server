class PrayersController < ApplicationController
  def index
    prayers = Prayer.all
    prayers = prayers.where("updated_at > '#{Time.at(Integer(params[:last_updated_at])/1000)}'") if params[:last_updated_at]
    prayers = prayers.where(category_id: params[:category_id]) if params[:category_id]
    render json: prayers.to_json
  end

  def update
    if Prayer.find(params[:id]).update_attribute(params[:key], params[:value])
      puts "-----", "Saved prayer: #{params[:key]} => #{params[:value]}", "-----"
      render json: {message: 'Oração salva com sucesso'}
    else
      puts "-----", "Error saving prayer: #{params[:key]} => #{params[:value]}", "-----"
      render json: {message: 'Erro ao salvar a oração'}
    end
  end
end
