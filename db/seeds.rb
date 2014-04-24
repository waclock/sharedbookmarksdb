# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.where(:email => 'admin@example.com').first_or_create
admin.password = 'admin'
admin.password_confirmation = 'admin'
admin.first_name = 'My'
admin.last_name = 'Name'
admin.save
admin.update_attribute :active, true
admin.update_attribute :admin, true