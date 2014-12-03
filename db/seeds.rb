# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(
  {
    email: 'admin@example.com',
    password: 'password',
    firstname: 'Admin', lastname: 'Admin',
    admin: true
  }
)

users = User.create([
  {
    email: 'first@example.com',
    password: 'password',
    firstname: 'Joe', lastname: 'Doe'
  },
  {
    email: 'second@example.com',
    password: 'password',
    firstname: 'John', lastname: 'Smith'
  },
  {
    email: 'third@example.com',
    password: 'password',
    firstname: 'Anne', lastname: 'Smith'
  },
  {
    email: 'fourth@example.com',
    password: 'password',
    firstname: 'Bill', lastname: 'Williams'
  }
])

category = Category.create(name: "Example category")

products = Product.create([
  {
    title: 'Product', description: "This product is a fine product.", price: 19.99,
    category: category, user: admin
  },
  {
    title: 'Thing', description: "This thing is a good thing.", price: 6.66,
    category: category, user: admin
  },
  {
    title: 'Stuff', description: "Some stuff is better than no stuff.", price: 100.01,
    category: category, user: users.first
  }
])

reviews = Review.create([
  {
    content: "Nice product, I like it.", rating: 4, user: users[0], product: products.first
  },
  {
    content: "It's the best product ever!", rating: 5, user: users[1], product: products.first
  },
  {
    content: "Not worth the money.", rating: 1, user: users[2], product: products.first
  }
])



