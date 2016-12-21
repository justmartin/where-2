# Where 2

Inpsired by my passion for traveling, I created something that answered the question: "How far could my dollar take me in a given country?". 

## How To Launch

Clone repository and cd into project's directory

Run 'rails s'

Visit 'http://localhost:3000/'

## Usage

From home, you can enter an amount in USD. This serves as the user's budget for days calculations.
You will also select a location from the dropdown of available countries. 
Then click 'Explore'. On the results page, you'll see how many days your budget will last you depending on if you're a budget, midrange, or luxury traveler. Below the days are sample cost breakdowns per day to get a better idea of where the budget is allocated.

## How Data Is Collected

Travel costs are collected from the BudgetYourTrip api. Amounts are taken from real travelers who have signed up to use the service. 

Costs are broken down into 3 categories: Budget, Midrange, and Luxury. The number of days a user could last is calculated based on the user budget divided by the daily cost of each category. Information about what is included in daily cost can be found below the price cards.

For more info visit: http://www.budgetyourtrip.com/calculations.php
