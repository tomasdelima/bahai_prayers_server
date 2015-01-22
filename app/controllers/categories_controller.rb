class CategoriesController < ApplicationController
  def index
    render json: Category.all.to_json
  end
end
