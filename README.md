Problem Statement
Create the backend for an e-Commerce app which has the following features:
● The App has products - which has fields like `name`, `description`, `images`, `price`,
`discounted price` etc.
● A product can have multiple attributes , and each attribute will have multiple options
● A product that has attributes will also have a variation for every combination of
attribute-options
● Each variation of a product can override all the details of the base product (i.e. a
variation can have different price, images, name and even description). See below for
example of a product with attributes, options and variations
● It is not essential for every Product to have attributes. Some products (for example a
“USB Cable”) will have no attributes or options and hence no variations
● Note the distinction between a Product w/o Variations vs a Product w/ Variations – a
Product w/o Variation is directly purchasable , while a Product w/ Variation is not
purchasable , instead it’s Variations are purchasable. Keep this in mind while inferencing
the APIs defined below
Example of product with variations:
-
-
-
-
-
-
An “iPhone X” is a Product.
It has 2 Attributes: “storage” and “color”
Where the Attribute “storage” has 3 Options: “64GB”, “128GB” and “256GB”
And the Attribute “color” has 3 Options: “White”, “Black” and “Red”
Given the above options, this Product will have 9 Variations (3 storages x 3 colors):
“64GB, White”, “128GB, White”, “256GB, White”, “64GB, Black” .... etc.
Each of these 9 variations can have different prices, images etc.
The product “iPhone X” is not itself purchasable, but it’s 9 variations “iPhone X 64GB,
White” etc are purchasable
Requirement
The task is to architect the model, entity and relationship for this requirement. And expose the
following APIs:
● GET /purchasables – Returns list of “purchasable” items
API Parameters:
‒ search: optional query param. If present, only the purchasables (products /
variations) whose name matches the search term will be returned. Partial matches
are to be allowed
‒ filters: optional query param to allow the user to filter the results by one or more
options. (The format of this param is left up to the applicant, you can use array,associative array or base64 encoded staring or anything else that suits you. Make
sure to document the format that you end up deploying)
Example response: https://assignment-appstreet.herokuapp.com/api/v1/products
●
GET /purchasables/:id – Returns the product details for a given purchasable id
API Parameters:
‒ id: mandatory path param, The ID of the purchasable item whose details are
expected in response
Response: the response should return the base product, along with all it’s options,
attributes and variations (if any). For reference consider this example response:
https://assignment-appstreet.herokuapp.com/api/v1/products/5aec58965a39460004b3f6
dd
Submission
Candidates are expected to submit a complete and deployable app along with documentation of
the APIs as well as instructions for compiling and deploying. The source code is expected to be
shared via mail to the following mail id: submissions@appstreet.io . There is no restriction on the
choice of database or language, just ensure to keep the code well documented.0# appStreetDemoApp
