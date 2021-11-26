# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Role.create(username: "Admin")
Role.create(username: "Comentarista")
leitor = Role.create(username: "Leitor")
User.create(email: "admin@admin.com", password: "123456", role_id: admin.id)
User.create(email: "leitor@leitor.com", password: "123456", role_id: leitor.id)