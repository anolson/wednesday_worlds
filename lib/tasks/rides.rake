namespace "rides" do
  desc "Generate ride events (specify the start date with DATE)"
  task "create_events", [:date] => :environment do |t, args|
    if args.date.blank?
      raise "Please specify a start date with ['YYYY-MM-DD']"
    end

    ride = Ride.first
    date = Date.parse(args.date)
    wednesdays = 33.times.map { |i| date + i.weeks }

    ride.events.destroy_all

    wednesdays.zip(template).each { |wednesday, params|
      ride.events.create(
        begins_at: "#{wednesday} #{params[:time]}",
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
      { time: "17:30", route: "bburg-short" },
      { time: "17:30", route: "bburg-short" }
    ]
  end
end
