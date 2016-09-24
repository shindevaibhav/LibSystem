# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Creating a default admin
#TODO
# execute "INSERT INTO admins (name,email,password_digest) VALUES ('LibSystem Root','root@libSys.com', '$2a$10$bxnGljeITdh1vjpt944fD.0nGxUsirQ/S.CuG3aSiHnik8dGSlU1K');"

root = Admin.new({:name =>"LibSystem Root", :email => "root@libsys.com",  :password => "root_123", :password_confirmation => "root_123" })

root.save!