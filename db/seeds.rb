# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Cinema.create(name: "Popcorn", cinema_hall_count: "5", location: "Moscow")
Movie.create(name: "Barbie", genre: "comedy", duration: "120")
Movie.create(name: "Oppenheimer", genre: "drama", duration: "180")
Session.create(viewers_count: "50", time: "15:15")
Session.create(viewers_count: "36", time: "12:00")
User.create(name: "Luna", surname: "Lovegood", email: "lovegood@mail.ru")
User.create(name: "Nevil", surname: "Longbottom", email: "longbottom@mail.ru")
