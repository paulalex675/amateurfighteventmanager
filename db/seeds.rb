# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Gym.destroy_all
styles = Style.create([
    { name: 'Muay Thai' },
    { name: 'Boxing' },
    { name: 'MMA' },
    { name: 'K1' },
    { name: 'Brazilian Ju-Jitsu' },
    { name: 'Judo' },
    { name: 'Karate - Shotokan-Ryu' },
    { name: 'Karate - Wado-Ryu' },
    { name: 'Karate - Shito-Ryu' },
    { name: 'Karate - Goju-Ryu' },
    { name: 'Taekwondo' },
    { name: 'Wu Shu Kwan' },
    { name: 'Jeet Kun Do' },
    { name: 'Wing Chun' },
    { name: 'Jujutsu' },
    { name: 'Aikido' },
    { name: 'Krav Maga' },
    { name: 'Capoeira' },
    { name: 'Wrestling' },
    { name: 'Hapkido' },
    { name: 'Sambo' },
    { name: 'Kendo' },
    { name: 'Tang Soo Do' },
    { name: 'Sumo' },
    { name: 'Shaolin Kung Fu' }
    ])

20.times do |index|
    User.create!([{ 
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: "#{Faker::Superhero.prefix} #{Faker::Superhero.descriptor}",
        email: "seeded_user#{index}@example.com",
        password: 'password',
        bio: Faker::TvShows::BigBangTheory.quote
    }])
end

5.times do |index| 
    User.all.sample.gyms.create(name: Faker::Music::RockBand.name, style_id: rand(1..24), email: "gym_num#{index}@email.com", telephone: Faker::PhoneNumber.cell_phone, num_prems: 0)
end

17.times do |index|
    User.all.sample.fight_profiles.create(ring_name: "#{Faker::Superhero.prefix} #{Faker::Superhero.descriptor}", style_id: rand(1..24), gym_id: Gym.all.sample.id, gender: [1, 2].sample.to_i, fight_weight: rand(60...120))
end

17.times do |index|
    User.all.sample.fight_records.create(style_id: rand(1..24), win: rand(0...10), lose: rand(0...10), draw: rand(0...10))
end