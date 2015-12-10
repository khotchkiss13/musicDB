class SearchController < ApplicationController
  def index
    @q = Individual.ransack(params[:q])
  end
  def advanced
  end
  def results
    @q1 = Individual.ransack(params[:q])
    @individuals = @q1.result(distinct: true)
    @q2 = Group.ransack(params[:q])
    @groups = @q2.result(distinct: true)
    @q3 = RecordLabel.ransack(params[:q])
    @labels = @q3.result(distinct: true)
    @q4 = Release.ransack(params[:q])
    @releases = @q4.result(distinct: true)
    @q5 = Show.ransack(params[:q])
    @shows = @q5.result(distinct: true)
    @q6 = Song.ransack(params[:q])
    @songs = @q4.result(distinct: true)
  end
end
