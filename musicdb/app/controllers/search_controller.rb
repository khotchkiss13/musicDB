class SearchController < ApplicationController
  def index
  end
  def advanced
  end
  def results
    q = params[:q]
    @individuals = Individual.ransack(name_cont: q).result
    @groups = Group.ransack(name_cont: q).result
    @labels = RecordLabel.ransack(name_cont: q).result
    @releases = Release.ransack(name_cont: q).result
    @shows = Show.ransack(name_cont: q).result
    @songs = Song.ransack(name_cont: q).result
  end
end
