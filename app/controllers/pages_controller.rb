class PagesController < ApplicationController
  def index
    @this_week = Event.this_week
    @next_week = Event.next_week
    @events = [@this_week, @next_week].compact
  end
end
