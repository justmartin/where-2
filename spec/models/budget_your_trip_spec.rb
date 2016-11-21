require "rspec"
require_relative "../../app/models/budget_your_trip.rb"

describe BudgetYourTrip do
  describe ".days_on_budget" do
    it "calculates number of days for budget/midrange/luxury" do
      budget = "1000"
      country_code = "THB"
      budget_amount = "660.84723802611"
      expect(BudgetYourTrip.days_on_budget("1000", "THB", "660.84723802611")).to eq 55
    end

    it "calculates number of days for budget/midrange/luxury" do
      budget = "1000"
      country_code = "THB"
      midrange_amount = "1804.722688247"
      expect(BudgetYourTrip.days_on_budget("1000", "THB", "1804.722688247")).to eq 20
    end

    it "calculates number of days for budget/midrange/luxury" do
      budget = "1000"
      country_code = "THB"
      luxury_amount = "5323.9282342373"
      expect(BudgetYourTrip.days_on_budget("1000", "THB", "5323.9282342373")).to eq 6
    end
  end

  


  
end