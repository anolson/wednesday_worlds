this_wednesday = Date.current.beginning_of_week + 2.days
next_wednesday = (Date.current + 1.week).beginning_of_week + 2.days

bburg_copy = File.read Rails.root.join("db/seeds/bburg_copy.txt")
tabor_copy = File.read Rails.root.join("db/seeds/tabor_copy.txt")
bburg_short_copy = File.read Rails.root.join("db/seeds/bburg_short_copy.txt")

ww = Ride.create(name: 'Wednesday Worlds', location: 'Bollo\'s')

bburg_road = Route.create(
  name: 'Blacksburg road',
  description: bburg_copy,
  map_url: 'https://goo.gl/maps/ZaucV',
  slug: 'bburg')

Event.create(begins_at: "#{this_wednesday} 18:00", ride: ww, route: bburg_road)

tabor = Route.create(
  name: 'Mt Tabor road',
  description: tabor_copy,
  map_url: 'https://goo.gl/maps/MS2kw',
  slug: 'tabor')

Event.create(begins_at: "#{next_wednesday} 18:00", ride: ww, route: tabor)

bburg_road_short = Route.create(
  name: 'Blacksburg Rd (short)',
  description: bburg_short_copy,
  map_url: 'https://goo.gl/maps/uRRtKRmnsQw',
  slug: 'bburg-short')

User.create(email: 'anolson@gmail.com', password: 'secret')
EmailNotifier.create(recipient: 'anolson@gmail.com', ride: ww)
