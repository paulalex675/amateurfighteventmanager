# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{ first_name: 'Luke', last_name: 'Skywalker', username: 'Darthson', email: 'dummy@email.com', encrypted_password: 'password', bio: "I've searched the galaxy for the lost jedi text...and tacos" },
                     { first_name: 'Mary-Sue', last_name: "De'laurio", username: 'Ms_Del', email: 'dummy@email.com', encrypted_password: 'password', bio: "All I know is boxing and line dancing" },
                     { first_name: 'Matsumoto', last_name: 'Murasashi', username: 'dualkat', email: 'dummy@email.com', encrypted_password: 'password', bio: "I travel Japan dueling the best warriors I can find, live by the sword, die by the sword" },
                     { first_name: 'Chuck', last_name: 'Norris', username: 'lonewolf', email: 'dummy@email.com', encrypted_password: 'password', bio: "It's a cold, hard world out there and it will eat you up if you let it" },
                     { first_name: 'Mickey', last_name: "O'Neil", username: 'Mickeythepikey', email: 'dummy@email.com', encrypted_password: 'password', bio: "I love dags and caravans" }])

