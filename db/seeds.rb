# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



ride = Ride.create(:name => 'Wednesday Worlds', :location => 'Bollo\'s', :currently_active => true)
tabor = Route.create(:name => 'Tabor loop', :description => 'Out Mt Tabor, back Blacksburg rd.', :map_url => 'http://maps.google.com', :ride => ride)
recurrence = Recurrence.create(:recurrence_type => 'weekly', :recurrence_begins_on => '2010-05-05', :recurrence_ends_on => '2010-06-30', :starts_at => '18:00', :route => tabor);

#Route.create(:name => 'Traditional route', :description => 'Out and back back on Blacksburg rd.', :begins_at => '2010-05-26T18:00:00', :map_url => 'http://maps.google.com', :ride => ride)

