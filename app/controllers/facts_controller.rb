class FactsController < ApplicationController
  def index
    @facts = Fact.all
    @facts = @facts.where("updated_at > '#{params[:last_updated_at]}'") if params[:last_updated_at] != '0'
    render json: {data: @facts.to_json, time: Time.now.utc}
  end
end
