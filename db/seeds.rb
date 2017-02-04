# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Owner
owner1 = Owner.where(ssn: '123456789').first_or_create!
owner2 = Owner.where(ssn: '987654321').first_or_create!

# Property
property1 = Property.where(owner: owner1).first_or_initialize
property1.value = 10000000
property1.save!

property2 = Property.where(owner: owner2).first_or_initialize
property2.value = 20000000
property2.save!

# Loan
loan1 = Loan.where(owner: owner1, property: property1, status: 'pending').first_or_initialize
loan1.amount = 1000000
loan1.save!

loan2 = Loan.where(owner: owner2, property: property2, status: 'pending').first_or_initialize
loan2.amount = 5000000
loan2.save!
