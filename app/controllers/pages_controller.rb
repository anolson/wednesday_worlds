class PagesController < ApplicationController
  def index
    @this_week = Event.this_week
    @events = Event.next_two
  end
end
