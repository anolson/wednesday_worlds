class PagesController < ApplicationController
  def index
    @this_week = Event.this_week
    @events = Event.upcoming
  end
end
