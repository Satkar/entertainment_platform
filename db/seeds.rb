# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Using FactoryBots for seeding the data for test purpose

# Seed Movies with purchase option
FactoryBot.create_list(:movie_with_hd_and_sd_quality, 10)

# Seed Seasons with its episodes and pricing
FactoryBot.create_list(:season_with_hd_quality, 10)

# Seed Users 
FactoryBot.create_list(:user, 20)

# Seed Library Items for last User in the system
FactoryBot.create_list(:library_item, 10, user_id: User.last.id)