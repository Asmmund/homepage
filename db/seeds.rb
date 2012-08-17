# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#!/bin/env ruby
# encoding: utf-8
Article.delete_all
Article.create(title: 'first', text: 'first')
Article.create(title: 'second', text: 'second')
User.delete_all
# elmor = > S@uron
User.create( name: 'elmor',
password_digest: '$2a$10$yENP4/FvI/2px1ebuZsj0e0eNN11k/mmfbokOA/udwFClCPlPWe7.')
