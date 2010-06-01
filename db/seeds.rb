# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



ride = Ride.create(:name => 'Wednesday Worlds', :location => 'Bollo\'s')
tabor = Route.create(:name => 'Tabor loop', :description => 'Out Mt Tabor, back Blacksburg rd.', :map_url => 'http://maps.google.com', :ride => ride)
recurrence = Recurrence.create(:type => 'weekly', :begins_at => '2010-05-05T18:00:00', :ends_at => '2010-05-30T18:00:00', :route => tabor);

#Route.create(:name => 'Traditional route', :description => 'Out and back back on Blacksburg rd.', :begins_at => '2010-05-26T18:00:00', :map_url => 'http://maps.google.com', :ride => ride)

