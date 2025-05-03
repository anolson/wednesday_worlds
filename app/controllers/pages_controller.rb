class PagesController < ApplicationController
  def index
    @global_message = ENV["GLOBAL_MESSAGE"]
    @this_week = Event.this_week
    @events = Event.upcoming
  end
end
