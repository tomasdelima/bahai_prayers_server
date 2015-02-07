class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @categories = @categories.where("updated_at > '#{Time.at(Integer(params[:last_updated_at])/1000)}'") if params[:last_updated_at]
    respond_to do |format|
      format.json { render json: @categories.to_json }
      format.html { render :index }
    end
  end

  def show
    @category = Category.find(params[:id])
    @prayers = @category.prayers
  end

  def update
    Category.find(params[:id]).update_attribute(:title, params[:value])
    render json: {message: 'Categoria salva com sucesso'}
  end
end
