require "rspec"
require_relative "../../app/models/budget_your_trip.rb"
require "money"
require "money/bank/google_currency"

describe BudgetYourTrip do

  # Thailand tests ===========================================================================
  describe ".get_country_average_costs" do
    it "gets daily average for budget/midrange/luxury" do
      country = "TH"

      expect(BudgetYourTrip.get_country_average_costs(country)["data"][-1]["value_budget"]).to eq "743.47221460572"
    end

    it "gets daily average for budget/midrange/luxury" do
      country = "TH"

      expect(BudgetYourTrip.get_country_average_costs(country)["data"][-1]["value_midrange"]).to eq "2017.9768362617" 
    end

    it "gets daily average for budget/midrange/luxury" do
      country = "TH"

      expect(BudgetYourTrip.get_country_average_costs(country)["data"][-1]["value_luxury"]).to eq "5886.9272304853"
    end
  end

  describe ".get_cost_categories" do
    it "gets all cost categories" do
      expect(BudgetYourTrip.get_cost_categories["data"].count).to eq 18
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
      Money.default_bank = Money::Bank::GoogleCurrency.new

      currency_code = "THB"
      amount = "5886.9272304853"

      expect(BudgetYourTrip.convert_to_usd(currency_code, amount).fractional).to eq 16786
    end
  end

  # Portugal tests ===========================================================================

  # describe ".get_country_average_costs" do
  #   it "gets daily average for budget/midrange/luxury" do
  #     country = "PT"

  #     expect(BudgetYourTrip.get_country_average_costs(country)["data"][-1]["value_budget"]).to eq "33.323330248812"
  #   end

  #   it "gets daily average for budget/midrange/luxury" do
  #     country = "PT"

  #     expect(BudgetYourTrip.get_country_average_costs(country)["data"][-1]["value_midrange"]).to eq "81.410269438208" 
  #   end

  #   it "gets daily average for budget/midrange/luxury" do
  #     country = "PT"

  #     expect(BudgetYourTrip.get_country_average_costs(country)["data"][-1]["value_luxury"]).to eq "188.97370600531"
  #   end
  # end

  # describe ".get_currency_code" do
  #   it "gets currency code for given country" do
  #     country = "PT"

  #     expect(BudgetYourTrip.get_currency_code(country)["data"]["currency_code"]).to eq "EUR" 
  #   end
  # end

  # describe ".get_currency_symbol" do
  #   it "gets currency symbol for given currency code" do
  #     country_code = "EUR"

  #     expect(BudgetYourTrip.get_currency_symbol(country_code)["data"]["symbol"]).to eq "&#8364;"
  #   end
  # end

  # describe ".days_on_budget" do
  #   it "calculates number of days for budget" do
  #     budget = "1000"
  #     currency_code = "EUR"
  #     budget_amount = "33.137543575489"

  #     expect(BudgetYourTrip.days_on_budget(budget, currency_code, budget_amount)).to eq 28
  #   end

  #   it "calculates number of days for midrange" do
  #     budget = "1000"
  #     currency_code = "EUR"
  #     midrange_amount = "80.80016743536"

  #     expect(BudgetYourTrip.days_on_budget(budget, currency_code, midrange_amount)).to eq 11
  #   end

  #   it "calculates number of days for luxury" do
  #     budget = "1000"
  #     currency_code = "EUR"
  #     luxury_amount = "186.62575236443"

  #     expect(BudgetYourTrip.days_on_budget(budget, currency_code, luxury_amount)).to eq 5
  #   end
  # end

  # describe ".convert_to_usd" do
  #   it "converts currency amounts to usd" do
  #     currency_code = "EUR"
  #     amount = "186.62575236443"

  #     expect(BudgetYourTrip.convert_to_usd(currency_code, amount)).to eq 197.8232975063
  #   end
  # end

end