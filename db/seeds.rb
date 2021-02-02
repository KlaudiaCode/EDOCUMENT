# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(role: 'admin', usernum: 'ADMIN', email: 'em@wp.pl', password: 'admin', active: true)
User.create(role: 'student', usernum: '123456', email: 'estudm@wp.pl', password: '123456', active: true)