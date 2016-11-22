require "rspec"
require_relative "../../app/models/budget_your_trip.rb"

describe BudgetYourTrip do
  describe ".days_on_budget" do
    it "calculates number of days for budget/midrange/luxury" do
      budget = "1000"
      currency_code = "THB"
      budget_amount = "660.84723802611"

      expect(BudgetYourTrip.days_on_budget("1000", "THB", "660.84723802611")).to eq 55
    end

    it "calculates number of days for budget/midrange/luxury" do
      budget = "1000"
      currency_code = "THB"
      midrange_amount = "1804.722688247"

      expect(BudgetYourTrip.days_on_budget("1000", "THB", "1804.722688247")).to eq 20
    end

    it "calculates number of days for budget/midrange/luxury" do
      budget = "1000"
      currency_code = "THB"
      luxury_amount = "5323.9282342373"

      expect(BudgetYourTrip.days_on_budget("1000", "THB", "5323.9282342373")).to eq 6
    end
  end

  describe ".convert_to_usd" do
    it "converts currency amounts to usd" do
      currency_code = "THB"
      amount = "5323.9282342373"

      expect(BudgetYourTrip.convert_to_usd(currency_code, amount)["data"]["newAmount"]).to eq 149.96980941513
    end
  end

  describe ".get_country_average_costs" do
    it "gets daily average for budget/midrange/luxury" do
      country = "TH"

      expect(BudgetYourTrip.get_country_average_costs(country)["data"][-1]["value_budget"]).to eq "660.84723802611"
    end

    it "gets daily average for budget/midrange/luxury" do
      country = "TH"

      expect(BudgetYourTrip.get_country_average_costs(country)["data"][-1]["value_midrange"]).to eq "1804.722688247" 
    end

    it "gets daily average for budget/midrange/luxury" do
      country = "TH"

      expect(BudgetYourTrip.get_country_average_costs(country)["data"][-1]["value_luxury"]).to eq "5323.9282342373"
    end
  end

  describe ".get_currency_code" do
    it "gets currency code for given country" do
      country = "TH"

      expect(BudgetYourTrip.get_currency_code(country)["data"]["currency_code"]).to eq "THB" 
    end
  end

  describe ".get_currency_symbol" do
    it "gets currency symbol for given currency code" do
      country_code = "THB"

      expect(BudgetYourTrip.get_currency_symbol(country_code)["data"]["symbol"]).to eq "B"
    end
  end

end