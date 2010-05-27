# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



ride = Ride.create(:name => 'Wednesday Worlds', :location => 'Bollo\'s')
Route.create(:name => 'Tabor loop', :description => 'Out Mt Tabor, back Blacksburg rd.', :begins_at => '2010-05-19T18:00:00', :map_url => 'http://maps.google.com', :ride => ride)
Route.create(:name => 'Traditional route', :description => 'Out and back back on Blacksburg rd.', :begins_at => '2010-05-26T18:00:00', :map_url => 'http://maps.google.com', :ride => ride)

