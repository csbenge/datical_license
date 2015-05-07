# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
User.create!(firstname:  "Carey", lastname:  "Benge",
             email: "carey@datical.com",
             password:              "password",
             password_confirmation: "password",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
User.create!(firstname:  "Derek", lastname:  "Hutson",
            email: "dhutson@datical.com",
            password:              "password",
            password_confirmation: "password",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

=begin
99.times do |n|
  name  = Faker::Name.name.split(' ')
  firstname = "#{name[0]}"
  lastname  = "#{name[1]}"
  email 		= "example-#{n+1}@example.org"
  password = "password"
  User.create!(firstname:  firstname, lastname:  lastname,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
=end
