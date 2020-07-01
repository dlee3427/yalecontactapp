# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



["ES", "MC", "MY", "BF"].each do |rc|
    ResCollege.create(name: rc)
end

10.times do
    User.create(
        name: Faker::Name.name,
        class_year: rand(2021..2024),
        res_college: ResCollege.all.sample,
        user_type: ["student", "student", "faculty"].sample
    )
end

toads = Location.create(name: "Toad's Place", building: "Off-Campus")
sss = Location.create(name: "SSS 114", building: "SSS")
dorm = Location.create(name: "ES-A22", building: "Ezra Stiles College")


first_day = Time.new(2020, 9, 1)
last_day = first_day + 3.days

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

f1 = Facility.new(name: "Yale Visitor Testing Center")
f2 = Facility.new(name: "Old Campus Testing Center")
f3 = Facility.new(name: "Science Hill Testing Center")
