# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



ride = Ride.create(:name => 'Wednesday Worlds', :location => 'Bollo\'s', :currently_active => true)
tabor = Route.create(:name => 'Tabor loop', :description => 'Out Mt Tabor, back Blacksburg rd.', :map_url => 'http://maps.google.com', :ride => ride)
occurrence = Occurrence.create(:recurs => true, :recurrence_type => 'weekly', :recurrence_ends_at => '2010-06-30 18:00', :begins_at => '2010-05-05 18:00', :route => tabor);

#Route.create(:name => 'Traditional route', :description => 'Out and back back on Blacksburg rd.', :begins_at => '2010-05-26T18:00:00', :map_url => 'http://maps.google.com', :ride => ride)

