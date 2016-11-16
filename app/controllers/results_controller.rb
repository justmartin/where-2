class ResultsController < ApplicationController

  def index
    @parsed = BudgetYourTrip.get_country_average(params[:country])
  end
  
end
