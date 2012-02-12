# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Note.create(title: 'first note', content: 'dummy note', tag: 'code', user_id: 1)
Note.create(title: 'second user', content: 'dummy note', tag: 'code', user_id: 2)