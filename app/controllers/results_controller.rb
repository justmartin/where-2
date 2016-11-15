class ResultsController < ApplicationController

  def index
    @parsed = BudgetYourTrip.categories
  end
  
end
