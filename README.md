# Purchase Date Analysis SQL

There's a database with the following tables:
* city
    * city_id
    * client_city_id
    * city
    * client_city
* client
    * client_id
    * client_city_id
    * birth_date
    * registration
* promotion
    * promotion_id
    * category_id
    * promotion_name
    * category_name
    * partner_id
    * partner_name
* purchase
    * purchase_id
    * partner_id
    * client_id
    * city_id
    * promotion_id
    * category_id
    * purchase_date
    * price
    * quantity 
    * status

Write a query to get a table containing these fields:
* purchase_date
* purchase_id
* client_id
* client_age
* client_registration_age
* client_category – 'new' if a client purchased just once, otherwise 'old'
* promotion_name
* category_name
* partner_name
* client_city
* city
* revenue
* quantity

This table must contain rows where `status=1` and `purchase_date` is from 01.05.2020 to 01.08.2020

This query joins the purchase, client, city, promotion, and a subquery to determine client categories. It filters the results by status and date range. The resulting table includes the required fields.
