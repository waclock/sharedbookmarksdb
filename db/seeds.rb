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
grupo1=Group.where(name:"Group1",user_id: admin.id).first_or_create
folder1=Folder.where(name:"Folder1",group_id: grupo1.id).first_or_create
link1=Bookmark.where(link:"http://office.microsoft.com/en-us/project-help/export-or-import-data-to-another-file-format-HA010217616.aspx",name:"Link microsoft",folder_id: folder1.id).first_or_create
link2=Bookmark.where(link:"http://lucatironi.github.io/tutorial/2012/10/15/ruby_rails_android_app_authentication_devise_tutorial_part_one/",name:"Tutorial Rails",folder_id: folder1.id).first_or_create
admin.update_attribute :active, true
admin.update_attribute :admin, true