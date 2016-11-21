module ResultsHelper
  def randomized_budget_image
    images = ["assets/budget-travel1.jpg", "assets/budget-travel2.jpg", "assets/budget-travel3.jpg"]
    images[rand(images.size)]
  end

  def randomized_midrange_image
    images = ["assets/midrange-travel1.jpg", "assets/midrange-travel2.jpg", "assets/midrange-travel3.jpg"]
    images[rand(images.size)]
  end

  def randomized_luxury_image
    images = ["assets/luxury-travel1.jpg", "assets/luxury-travel2.jpg", "assets/luxury-travel3.jpg"]
    images[rand(images.size)]
  end
end
