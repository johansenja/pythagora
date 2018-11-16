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

u = User.new(first_name: 'Matt', last_name: 'Walker', email: 'matt.w@moroccanrugs.com', password: 'password')
u.remote_photo_url = "https://res.cloudinary.com/datpeem3j/image/upload/v1542383654/m.png"
puts (u.save ? "buyer saved" : "invalid buyer")
d = User.new(first_name: 'Phelim', last_name: 'Dunleavy', tagline: 'Senior rails search specialist', email: 'phelim@lewagon.com', password: 'password', developer: true, photo: "vys0rdkzlzqtn7fbhrve")
d.remote_photo_url = "https://res.cloudinary.com/datpeem3j/image/upload/v1542386861/lcujf8nuqgvnxdlisada.jpg"
puts (d.save ? "developer saved" : "invalid developer")
d2 = User.new(first_name: 'Benjamin', last_name: 'Baranger', tagline: 'Senior Rais Developer', email: 'baranger@lewagon.com', password: 'password', developer: true, photo: "b")
d2.remote_photo_url = "https://res.cloudinary.com/datpeem3j/image/upload/v1542383960/b.jpg"
puts (d2.save ? "developer saved" : "invalid developer")

j = Job.new(name: 'E-Commerce Platform', description: 'Design an E-Commerce platform for my Moroccan rugs.', completed: true)
j.buyer = u
# j.developer = d2
puts (j.save ? "job saved" : "invalid job")

s = Skill.new(name: 'HTML')
s2 = Skill.new(name: 'Rails')
s3 = Skill.new(name: 'React')
s4 = Skill.new(name: 'CSS')
s5 = Skill.new(name: 'Python')
s6 = Skill.new(name: 'C++')
s7 = Skill.new(name: 'ElasticSearch')
s8 = Skill.new(name: 'Algolia')
puts (s.save ? "skill saved" : "invalid skill")
puts (s2.save ? "skill saved" : "invalid skill")
puts (s3.save ? "skill saved" : "invalid skill")
puts (s4.save ? "skill saved" : "invalid skill")
puts (s5.save ? "skill saved" : "invalid skill")
puts (s6.save ? "skill saved" : "invalid skill")
puts (s7.save ? "skill saved" : "invalid skill")
puts (s8.save ? "skill saved" : "invalid skill")

us = Userskill.new
us.skill = s
us.developer = d
puts (us.save ? "userskill saved" : "invalid userskill")

us2 = Userskill.new
us2.skill = s2
us2.developer = d2
puts (us.save ? "userskill saved" : "invalid userskill")

us3 = Userskill.new
us3.skill = s4
us3.developer = d
puts (us.save ? "userskill saved" : "invalid userskill")

us4 = Userskill.new
us4.skill = s3
us4.developer = d
puts (us.save ? "userskill saved" : "invalid userskill")

us5 = Userskill.new
us5.skill = s8
us5.developer = d2
puts (us.save ? "userskill saved" : "invalid userskill")

us6 = Userskill.new
us6.skill = s7
us6.developer = d
puts (us.save ? "userskill saved" : "invalid userskill")

b = Bid.new
b.developer = d2
b.buyer = u
b.job = j
b.successful = false
puts (b.save ? "bid saved" : "invalid bid")
