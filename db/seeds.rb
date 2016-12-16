# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


[{name: "Brandon Holt", class_year: "2016"},
 {name: "Ashley Less", class_year: "2016"},
 {name: "Amber Sweeny", class_year: "2016"},
 {name: "Luke Lo", class_year: "2016"},
 {name: "Trever Herbet", class_year: "2016"},
 {name: "Jess Everton", class_year: "2016"},
 {name: "William Chen", class_year: "2016"},
 {name: "Danny Oldman", class_year: "2016"},
 {name: "Heather Woodstry", class_year: "2016"},
 {name: "Rebecca Olson", class_year: "2015"},
 {name: "Robert Simpson", class_year: "2015"},
 {name: "Randy Trent", class_year: "2015"},
 {name: "Allie Lumpt", class_year: "2015"},
 {name: "Barbra O'Henry", class_year: "2015"},
 {name: "Issabella Goans", class_year: "2015"},
 {name: "Matt Shepard", class_year: "2015"},
 {name: "Troy Martin", class_year: "2015"},
].each do |graduate|
  Graduate.create(graduate)
end

[{first_name: "Brandon", last_name: "Holt", class_year: "2016", phone: "555-555-5555", address_line_one: "123 East St", city: "Lincoln", state: "NE", is_private: false, email: "brandon@email.com", password: "palmyra", password_confirmation: "palmyra"},
  {first_name: "Ashley", last_name: "Less", class_year: "2016", phone: "555-555-5555", address_line_one: "123 West St", city: "Lincoln", state: "NE", is_private: false, email: "ashley@email.com", password: "palmyra", password_confirmation: "palmyra"},
  {first_name: "Amber", last_name: "Sweeny", class_year: "2016", phone: "555-555-5555", address_line_one: "123 East St", city: "Omaha", state: "NE", is_private: true, email: "Amber@email.com", password: "palmyra", password_confirmation: "palmyra"},
  {first_name: "Jess", last_name: "Everton", class_year: "2016", phone: "555-555-5555", address_line_one: "456 Overton St", city: "Lincoln", state: "NE", is_private: true, email: "jess@email.com", password: "palmyra", password_confirmation: "palmyra"},
  {first_name: "William", last_name: "Chen", class_year: "2016", phone: "555-555-5555", address_line_one: "123 East St", city: "St. Paul", state: "MN", is_private: false, email: "will@email.com", password: "palmyra", password_confirmation: "palmyra"},
  {first_name: "Rebecca", last_name: "Olson", class_year: "2015", phone: "555-555-5555", address_line_one: "455 East St", city: "Lincoln", state: "NE", is_private: false, email: "rebecca@email.com", password: "palmyra", password_confirmation: "palmyra"},
  {first_name: "Randy", last_name: "Trent", class_year: "2015", phone: "555-555-5555", address_line_one: "123 East St", city: "Columbus", state: "NE", is_private: false, email: "randy@email.com", password: "palmyra", password_confirmation: "palmyra"},
  {first_name: "Allie", last_name: "Lumpt", class_year: "2015", phone: "555-555-5555", address_line_one: "123 East St", city: "Lincoln", state: "NE", is_private: true, email: "allie@email.com", password: "palmyra", password_confirmation: "palmyra"},
  {first_name: "Barbra", last_name: "O'Henry", class_year: "2015", phone: "555-555-5555", address_line_one: "4456 A St", city: "Lincoln", state: "NE", is_private: false, email: "Barbra@email.com", password: "palmyra", password_confirmation: "palmyra"},
  {first_name: "Matt", last_name: "Shepard", class_year: "2015", phone: "555-555-5555", address_line_one: "123 South St", city: "Lincoln", state: "NE", is_private: false, email: "matt@email.com", password: "palmyra", password_confirmation: "palmyra"},
  {first_name: "Troy", last_name: "Martin", class_year: "2015", phone: "555-555-5555", address_line_one: "123 East St", city: "Omaha", state: "NE", is_private: false, email: "troy@email.com", password: "palmyra", password_confirmation: "palmyra"}
].each do |classmate|
  Classmate.create(classmate)
end
