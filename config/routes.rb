Rails.application.routes.draw do

  get "/" => "home#index"
  get "/search" => "results#index"
  
end
