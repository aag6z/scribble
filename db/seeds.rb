# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.destroy_all
Comment.destroy_all

post1 = Post.create(title: "Hello World!", text: "Starting to learn rails! Woo!");
post2 = Post.create(title: "Week 5 of WDI", text: "Everything is going great!!");

post1.comments.create(text: "you suck!", author: "paul")
post2.comments.create(text: "how rude", author: "Amy")

post1.tags.create(tagtext: "funny")
post1.tags.create(tagtext: "hilarious")

post2.tags.create(tagtext: "awesome")
