# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Article.delete_all
Article.create( title: 'Title One',
    text: 'Title One<br />Title One<br />Title One')

Article.create( title: 'Title Two',
    text: 'Title Two<br />Title Two<br />Title Two')