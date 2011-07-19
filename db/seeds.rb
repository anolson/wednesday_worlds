ww = Ride.create(
  :name => 'Wednesday Worlds', 
  :location => 'Bollo\'s', 
  :currently_active => true)

blacksburg_road = Route.create(
  :name => 'Blacksburg road', 
  :description => 'Out and back on Blacksburg rd.', 
  :map_url => 'http://bit.ly/bCG3Lf', 
  :ride => ww)

blacksburg_road_occurrence = Occurrence.create(
  :recurs => true, 
  :recurrence_type => 'bi-weekly', 
  :recurrence_ends_at => '2011-10-05 18:00', 
  :begins_at => '2011-05-04 18:00', 
  :route => blacksburg_road);

tabor = Route.create(
  :name => 'Mt Tabor road', 
  :description => 'Out Mt Tabor Rd, back Blacksburg Rd', 
  :map_url => 'http://bit.ly/bSpQAT',
  :ride => ww)
  
tabor_occurrence = Occurrence.create(
  :recurs => true, 
  :recurrence_type => 'bi-weekly', 
  :recurrence_ends_at => '2011-10-12 18:00', 
  :begins_at => '2011-05-11 18:00', 
  :route => tabor)
  
Administrator.create(:name => 'Andrew Olson', :twitter_screen_name => 'andrew_olson')
  
# 
# andrew_gold = Ride.create(
#   :name => 'Andrew Gold', 
#   :location => 'Bollo\'s', 
#   :currently_active => false)
# 
# andrew_gold_route = Route.create(
#   :name => 'Andrew Gold route', 
#   :description => 'Out Blacksburg Rd, finish at the Blacksburg Town sign on Mt Tabor Rd', 
#   :map_url => 'http://bit.ly/bSpQAT',
#   :ride => andrew_gold)
#   
# andrew_gold_occurrence = Occurrence.create(
#   :recurs => false, 
#   :begins_at => '2011-01-22 10:00', 
#   :route => andrew_gold_route)
# 
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