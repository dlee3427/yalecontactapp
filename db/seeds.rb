# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# generates residential colleges by abbreviation
["ES", "MC", "MY", "BF"].each do |rc|
    ResCollege.create(name: rc)
end

# generates 10 random users
10.times do
    User.create(
        name: Faker::Name.name,
        class_year: rand(2021..2024),
        res_college: ResCollege.all.sample,
        user_type: ["student", "student", "faculty"].sample
    )
end

# generates locations
toads = Location.create(name: "Toad's Place", building: "Off-Campus")
sss = Location.create(name: "SSS 114", building: "SSS")
dorm = Location.create(name: "ES-A22", building: "Ezra Stiles College")

# defines a 3 day period containing all of the seed data
first_day = Time.new(2020, 9, 1)
last_day = first_day + 3.days

# generates 100 random visits to toad's place at night between 2-3 hours long
100.times do
    start_time = Faker::Time.between_dates(from: first_day, to: last_day, period: :night)
    end_time = start_time + rand(2..3).hours
    Visit.create(
        user: User.all.sample,
        location: toads,
        start_time: start_time,
        end_time: end_time
    )
end

# generates 50 random visits to SSS during the day between 1-2 hours long
50.times do
    start_time = Faker::Time.between_dates(from: first_day, to: last_day, period: :day)
    end_time = start_time + rand(1..2).hours
    Visit.create(
        user: User.all.sample,
        location: sss,
        start_time: start_time,
        end_time: end_time
    )
end

# generates 50 random visits to the dorm at any time anywhere between 2-7 hours long
50.times do
    start_time = Faker::Time.between_dates(from: first_day, to: last_day, period: :all)
    end_time = start_time + rand(2..7).hours
    Visit.create(
        user: User.all.sample,
        location: dorm,
        start_time: start_time,
        end_time: end_time
    )
end