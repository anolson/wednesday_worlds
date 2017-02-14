namespace "events" do
  desc "Generate events for an entire year (specify the start date with [date])"
  task "generate", [:date] => :environment do |t, args|
    if args.date.blank?
      raise "Please specify a start date with ['YYYY-MM-DD']"
    end

    ride = Ride.first
    date = Date.parse(args.date)
    days = 33.times.map { |i| date + i.weeks }

    ride.events.destroy_all

    days.zip(template).each { |day, params|
      puts "Creating event #{day}"
      ride.events.create(
        begins_at: "#{day} #{params[:time]}",
        route: Route.for_slug(params[:route]))
    }
  end

  def template
    [
      { time: "17:30", route: "bburg" },
      { time: "17:30", route: "bburg" },
      { time: "17:30", route: "bburg" },
      { time: "17:30", route: "bburg" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "tabor" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "tabor" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "tabor" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "tabor" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "tabor" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "tabor" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "tabor" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "tabor" },
      { time: "18:00", route: "bburg" },
      { time: "18:00", route: "tabor" },
      { time: "17:30", route: "bburg" },
      { time: "17:30", route: "tabor" },
      { time: "17:30", route: "bburg" },
      { time: "17:30", route: "bburg-short" },
      { time: "17:30", route: "bburg-short" },
      { time: "17:15", route: "bburg-short" },
      { time: "17:15", route: "bburg-short" }
    ]
  end
end
