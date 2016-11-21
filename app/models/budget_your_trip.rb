class BudgetYourTrip
  def self.get_country_average_costs(country)
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/costs/country/" + country)

    api_call(url)
  end

  def self.get_cost_categories
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/categories")

    api_call(url)
  end

  def self.get_currency_code(country_code)
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/countries/" + country_code)

    api_call(url)
  end

  def self.get_currency_symbol(currency_code)
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/currencies/" + currency_code)

    api_call(url)
  end

  #============================================================

  def self.days_on_budget(budget, currency_code, country_budget)
    country_budget_usd = convert_to_usd(currency_code, country_budget)

    budget.to_i / country_budget_usd["data"]["newAmount"].to_i
  end

  def self.convert_to_usd(currency_code, amount)
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/currencies/convert/" + currency_code + "/USD/"+ amount)

    api_call(url)
  end

  private #=====================================================

  def self.api_call(url)
    req = Net::HTTP::Get.new(url.path)
    req.add_field("X-API-KEY", "justin.lamar.martin@gmail.com")

    res = Net::HTTP.new(url.host, url.port).start do |http|
      http.request(req)
    end

    JSON.parse(res.body).to_h
  end

end