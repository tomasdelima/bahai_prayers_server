class PrayersController < ApplicationController
  def index
    prayers = Prayer.all
    prayers = prayers.where("updated_at > '#{Time.at(Integer(params[:last_updated_at])/1000)}'") if params[:last_updated_at]
    prayers = prayers.where(category_id: params[:category_id]) if params[:category_id]
    prayers.each{|p| p.body = p.body.gsub(/(\n)+/, "<br><br>").html_safe}

    render json: prayers.to_json
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
end
