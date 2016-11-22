class ResultsController < ApplicationController

  def index
    @costs = BudgetYourTrip.get_country_average_costs(params[:country])["data"]
    @categories = BudgetYourTrip.get_cost_categories["data"]
    @code = BudgetYourTrip.get_currency_code(params[:country])
    @symbol = BudgetYourTrip.get_currency_symbol(@code["data"]["currency_code"])

    # merge to get category names into costs
    @categories.each do |name|
      @costs.each do |id|
        id.merge!(name) if id["category_id"] == name["category_id"]
      end
    end

    # merge to get currency code into costs for conversion to usd
    @costs.each { |cost| cost.reverse_merge!(@code["data"]) }

    # merge to get currency symbol into costs
    @costs.each { |cost| cost.reverse_merge!(@symbol["data"]) }

    @budget = BudgetYourTrip.days_on_budget(params[:budget], @costs[-1]["currency_code"], @costs[-1]["value_budget"])
    @midrange = BudgetYourTrip.days_on_budget(params[:budget], @costs[-1]["currency_code"], @costs[-1]["value_midrange"])
    @luxury = BudgetYourTrip.days_on_budget(params[:budget], @costs[-1]["currency_code"], @costs[-1]["value_luxury"])
  end
  
end
