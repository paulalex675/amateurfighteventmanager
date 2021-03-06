# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Gym.destroy_all
Event.destroy_all
styles = Style.create!([
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


