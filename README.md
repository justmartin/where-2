# Where 2

## How To Launch

Clone repository and cd into project's directory

Run 'rails s'

Visit 'http://localhost:3000/'

From here, you can enter an amount in USD. This serves as the user's budget for days calculations.
You will also select a location from the dropdown of available countries. 
Then click 'Explore'.

## How Data Is Collected

Travel costs are collected from the BudgetYourTrip api. Amounts are taken from real travelers who have signed up to use the service. 

Costs are broken down into 3 categories: Budget, Midrange, and Luxury. The number of days a user could last is calculated based on the user budget divided by the daily cost of each category. Information about what is included in daily cost can be found below the price cards.

For more info visit: http://www.budgetyourtrip.com/calculations.php
