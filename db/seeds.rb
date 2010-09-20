# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



ride = Ride.create(
  :name => 'Wednesday Worlds', 
  :location => 'Bollo\'s', 
  :currently_active => true)

tabor = Route.create(
  :name => 'Mt Tabor road', 
  :description => 'Out Mt Tabor Rd, back Blacksburg Rd', 
  :map_url => 'http://bit.ly/bSpQAT',
  :ride => ride)
  
tabor_occurrence = Occurrence.create(
  :recurs => true, :recurrence_type => 'bi-weekly', 
  :recurrence_ends_at => '2010-10-06 17:30', 
  :begins_at => '2010-05-05 17:30', 
  :route => tabor)

blacksburg_road = Route.create(
  :name => 'Blacksburg road', 
  :description => 'Out and back on Blacksburg rd.', 
  :map_url => 'http://bit.ly/bCG3Lf', 
  :ride => ride)
  
blacksburg_road_occurrence = Occurrence.create(
  :recurs => true, 
  :recurrence_type => 'bi-weekly', 
  :recurrence_ends_at => '2010-10-13 17:30', 
  :begins_at => '2010-05-12 17:30', :route => blacksburg_road);


