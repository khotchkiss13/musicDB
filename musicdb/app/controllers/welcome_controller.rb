class WelcomeController < ApplicationController
  def index
  end
  def create
  end
  def input
  	@group = Group.new
  	@individual = Individual.new
  	@song = Song.new
  	@release = Release.new
  	@show = Show.new
  	@record_label = RecordLabel.new
  end
end
