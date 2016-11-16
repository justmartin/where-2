class BudgetYourTrip
  def self.get_country_average(country)
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/costs/country/" + country)

    req = Net::HTTP::Get.new(url.path)
    req.add_field("X-API-KEY", "justin.lamar.martin@gmail.com")

    res = Net::HTTP.new(url.host, url.port).start do |http|
      http.request(req)
    end

    JSON.parse(res.body).to_h
  end

  def self.get_cost_categories
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/categories")

    req = Net::HTTP::Get.new(url.path)
    req.add_field("X-API-KEY", "justin.lamar.martin@gmail.com")

    res = Net::HTTP.new(url.host, url.port).start do |http|
      http.request(req)
    end

    JSON.parse(res.body).to_h
  end
end