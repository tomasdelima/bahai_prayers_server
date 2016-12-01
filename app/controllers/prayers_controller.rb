class PrayersController < ApplicationController
  before_action :authenticate_user!, unless: :index_json_request?

  def index
    prayers = Prayer.all
    prayers = prayers.where(category_id: params[:category_id]) if params[:category_id]
    prayers.each{|p| p.body = p.body.gsub(/(\n)+/, "<br><br>").html_safe}

    if params[:last_updated_at]
      prayers = prayers.where("updated_at > '#{params[:last_updated_at]}'")
      render json: {data: prayers.to_json, time: Time.now.utc}
    else
      render json: prayers.to_json
    end
  end

  def update
    begin
      prayer = Prayer.find(params[:id])
      params[:data].each do |data|
        prayer.update_attribute(data[0], data[1])
      end
      render json: {message: 'Oração salva com sucesso'}
    rescue => e
      puts e
      render json: {message: "Erro ao salvar oração: #{e}"}
    end
  end

  private

  def index_json_request?
    params[:action] == 'index' && params[:format] == 'json'
  end
end
