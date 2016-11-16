class ResultsController < ApplicationController

  def index
    @costs = BudgetYourTrip.get_country_average_costs(params[:country])["data"]
    @categories = BudgetYourTrip.get_cost_categories["data"]
    @code = BudgetYourTrip.get_currency_code(params[:country])
    # @budget = BudgetYourTrip.days_on_budget(params[:budget], @costs["data"][-1]["currency_code"], @costs["data"][-1]["value_budget"])

    @categories.each do |name|
      @costs.each do |id|
        id.merge!(name) if id["category_id"] == name["category_id"]
      end
    end

    @costs.each { |cost| cost.merge!(@code)}
    
  end
  
end
