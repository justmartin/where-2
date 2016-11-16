class ResultsController < ApplicationController

  def index

    @costs = BudgetYourTrip.get_country_average(params[:country])
    @categories = BudgetYourTrip.get_cost_categories

    @categories["data"].each do |name|
      @costs["data"].each do |id|
        id.merge!(name) if id["category_id"] == name["category_id"]
      end
    end
  end
  
end
