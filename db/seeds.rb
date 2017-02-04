# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Owner
owner = Owner.where(ssn: '123456789').first_or_create!

# Property
property = Property.where(owner: owner).first_or_initialize
property.value = 10000000
property.save!

# Loan
loan = Loan.where(owner: owner, property: property, status: 'pending').first_or_initialize
loan.amount = 1000000
loan.save!
