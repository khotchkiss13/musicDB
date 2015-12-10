class InputController < ApplicationController
  def data
    @group = Group.new
    @individual = Individual.new
    @song = Song.new
    @release = Release.new
    @show = Show.new
    @record_label = RecordLabel.new
  end
end
