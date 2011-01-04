# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



# ride = Ride.create(
#   :name => 'Wednesday Worlds', 
#   :location => 'Bollo\'s', 
#   :currently_active => false)
# 
# tabor = Route.create(
#   :name => 'Mt Tabor road', 
#   :description => 'Out Mt Tabor Rd, back Blacksburg Rd', 
#   :map_url => 'http://bit.ly/bSpQAT',
#   :ride => ride)
#   
# tabor_occurrence = Occurrence.create(
#   :recurs => true, :recurrence_type => 'bi-weekly', 
#   :recurrence_ends_at => '2010-10-06 17:15', 
#   :begins_at => '2010-05-05 17:15', 
#   :route => tabor)
# 
# blacksburg_road = Route.create(
#   :name => 'Blacksburg road', 
#   :description => 'Out and back on Blacksburg rd.', 
#   :map_url => 'http://bit.ly/bCG3Lf', 
#   :ride => ride)
#   
# blacksburg_road_occurrence = Occurrence.create(
#   :recurs => true, 
#   :recurrence_type => 'bi-weekly', 
#   :recurrence_ends_at => '2010-10-13 17:15', 
#   :begins_at => '2010-05-12 17:15', :route => blacksburg_road);

andrew_gold = Ride.create(
  :name => 'Andrew Gold', 
  :location => 'Bollo\'s', 
  :currently_active => false)

andrew_gold_route = Route.create(
  :name => 'Andrew Gold route', 
  :description => 'Out Blacksburg Rd, finish at the Blacksburg Town sign on Mt Tabor Rd', 
  :map_url => 'http://bit.ly/bSpQAT',
  :ride => andrew_gold)
  
andrew_gold_occurrence = Occurrence.create(
  :recurs => false, 
  :begins_at => '2011-01-22 10:00', 
  :route => andrew_gold_route)
  
# owen_cup = Ride.create(
#   :name => 'Andrew Gold', 
#   :location => 'Bollo\'s', 
#   :currently_active => false)
# 
# owen_cup_occurrence = Occurrence.create(
#   :recurs => false, 
#   :begins_at => '2011-01-29 10:00', 
#   :route => owen_cup_route)
#     
# owen_cup_route = Route.create(
#   :name => 'Andrew Gold route', 
#   :description => 'Out Mt Tabor Rd, back Blacksburg Rd (3x).  Finish at the top of Harding', 
#   :map_url => 'http://bit.ly/bSpQAT',
#   :ride => owen_cup)

