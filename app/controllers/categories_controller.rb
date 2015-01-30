class CategoriesController < ApplicationController
  def index
    categories = Category.all
    categories = categories.where("updated_at > '#{Time.at(Integer(params[:last_updated_at])/1000)}'") if params[:last_updated_at]
    render json: categories.to_json
  end
end
