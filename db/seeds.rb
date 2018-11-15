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

Job.create!(name: 'web design', description: 'design a web site', completed: true, buyer_id: u.id, developer_id: d)
Job.create!(name: 'landing page', description: 'I need a amazing landing page', completed: false, buyer_id: u.id, developer_id: d)
Job.create!(name: 'ruby on rails search ', description: 'I need a developer to build some advanced search features', buyer_id: u.id, developer_id: u)
Job.create!(name: 'Wordpress Tweaks', description: 'I need someone to help me with my wordpress template', buyer_id: u.id)



s = Skill.create!(name: 'html')


us = Userskill.new
us.skill = s
us.developer = d
puts (us.save ? "userskill saved" : "invalid userskill")

b = Bid.new
b.developer = d
b.buyer = u
b.job = j
puts (b.save ? "bid saved" : "invalid bid")
