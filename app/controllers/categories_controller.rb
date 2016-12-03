class CategoriesController < ApplicationController
  before_action :authenticate_user!, unless: :index_json_request?

  def index
    @categories = Category.all.order(:title)
    respond_to do |format|
      format.json {
        if params[:last_updated_at]
          @categories = @categories.where("updated_at > '#{params[:last_updated_at]}'") if params[:last_updated_at] != '0'
          render json: {data: @categories.to_json, time: Time.now.utc}
        else
          render json: @categories.to_json
        end
      }
      format.html { render :index }
    end
  end

  def show
    @category = Category.find(params[:id])
    @prayers = @category.prayers
  end

  def update
    begin
      category = Category.find(params[:id])
      params[:data].each do |data|
        category.update_attribute(data[0], data[1])
      end
      render json: {message: 'Categoria salva com sucesso'}
    rescue => e
      puts e
      render json: {message: "Erro ao salvar categoria: #{e}"}
    end
  end

  private

  def index_json_request?
    params[:action] == 'index' && params[:format] == 'json'
  end
end
