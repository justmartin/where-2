require "json"
require "money"
require "money/bank/google_currency"

class BudgetYourTrip

  def self.get_country_average_costs(country)
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/costs/country/" + country)

    request_country_info(url)
  end

  def self.get_cost_categories
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/categories")

    request_country_info(url)
  end

  def self.get_currency_code(country_code)
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/countries/" + country_code)

    request_country_info(url)
  end

  def self.get_currency_symbol(currency_code)
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/currencies/" + currency_code)

    request_country_info(url)
  end

  #============================================================

  def self.days_on_budget(budget, currency_code, country_budget)
    country_budget_usd = convert_to_usd(currency_code, country_budget)

    budget.to_i / (country_budget_usd.fractional.to_i / 100)
  end

  def self.convert_to_usd(currency_code, amount)
    Money.new(amount.to_f * 100, currency_code).exchange_to(:USD)
  end

  private #=====================================================

  def self.request_country_info(url)
    req = Net::HTTP::Get.new(url.path)
    req.add_field("X-API-KEY", "justin.lamar.martin@gmail.com")

    res = Net::HTTP.new(url.host, url.port).start do |http|
      http.request(req)
    end

    JSON.parse(res.body).to_h
  end

end