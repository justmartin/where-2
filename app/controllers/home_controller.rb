class HomeController < ApplicationController

  def index
    url = URI.parse("http://www.budgetyourtrip.com/api/v3/categories")

    req = Net::HTTP::Get.new(url.path)
    req.add_field("X-API-KEY", "justin.lamar.martin@gmail.com")

    res = Net::HTTP.new(url.host, url.port).start do |http|
      http.request(req)
    end

    @parsed = JSON.parse(res.body).to_h
  end

end
