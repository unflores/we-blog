# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Post.create(
  title: "Some Name",
  body: "Finding out if data has changed Rails uses changed? Unfortunately, tainted? doesn't seem to work for activerecord objects.",
  in_navigation: false,
  published: true
)

Post.create(
  title: "How to Add Lists to the Descriptions in Pivotal Tracker <a href='http://community.pivotaltracker.com/pivotal/topics/is_there_a_way_to_use_bullets_in_the_description_field_of_a_story' title=\"you're killing me buster!\">IMPOSSIBLE.</a>",
  body: "Kind of a bummer. Programmers work with lists, it's a well known fact.  On the plus side, they do offer a tasks functionality, but sometimes I just don't feel like checking things off.",
  in_navigation: false,
  published: true
)

