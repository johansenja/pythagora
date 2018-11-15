# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Userskill.destroy_all
Skill.destroy_all
Bid.destroy_all
Job.destroy_all
User.destroy_all

u = User.new(first_name: 'Joe', last_name: 'Schmoe', email: 'joe.schmoe@igfewca.com', password: 'password')
puts (u.save ? "buyer saved" : "invalid buyer")
d = User.new(first_name: 'Phelim', last_name: 'Dunleavy', tagline: 'senior rails developer', email: 'dev@elop.ment', password: 'password1', developer: true, photo: "vys0rdkzlzqtn7fbhrve")
puts (d.save ? "developer saved" : "invalid developer")

j = Job.new(name: 'web design', description: 'design a web site')
j.buyer = u
puts (j.save ? "job saved" : "invalid job")

s = Skill.new(name: 'html')
puts (s.save ? "skill saved" : "invalid skill")

us = Userskill.new
us.skill = s
us.developer = d
puts (us.save ? "userskill saved" : "invalid userskill")

b = Bid.new
b.developer = d
b.buyer = u
b.job = j
puts (b.save ? "bid saved" : "invalid bid")
