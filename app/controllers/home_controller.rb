class HomeController < ApplicationController
  def index
    @events = Event.last(3)
    @images = Image.last(3)
  end
end
