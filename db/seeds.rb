# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


HouseUser.destroy_all
MateProfile.destroy_all
User.destroy_all
House.destroy_all
Chore.destroy_all


require_relative './seeds/user'
require_relative './seeds/house'
require_relative './seeds/house_user'
require_relative './seeds/chore'