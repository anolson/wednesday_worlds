class PagesController < ApplicationController
  def index
    @this_week = Event.this_week
    @next_week = Event.next_week
  end
end
