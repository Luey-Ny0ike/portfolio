# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
  [ "nyoike@gmail.com", "marimba", true, false ],
  [ "nyoikelewis@gmail.com", "heiannidan7", true, true ]
]

user_list.each do |email, password, user_role, superadmin_role|
  User.create(email: email, password: password, user_role: user_role, superadmin_role: superadmin_role)
end
