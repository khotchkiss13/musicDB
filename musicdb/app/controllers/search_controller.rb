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
    @labels = RecordLabel.ransack(ceo_cont: q).result
    @releases = Release.ransack(name_cont: q).result
    @shows = Show.ransack(name_cont: q).result
    @songs = Song.ransack(name_cont: q).result
  end

  def advanced_results
    q1 = params[:q1]
    if !q1.nil?
      num = params['num_comp1']
      field = params['group_field1']
      cond = params['cond1']
      if field.is_a? Integer
        if !num.eql?""
          if num.eql?"<"
          end
          if num.eql?">"
          end
        end
      end

      @groups = Group.ransack(name_cont: q1).result
    end

    q10 = params[:q10]
    if !q10.nil?
      num = params['num_comp10']
      field = params['song_field2']
      cond = params['cond10']
      if field.is_a? Integer
        if !num.eql?""
          if num.eql?"<"
          end
          if num.eql?">"
          end
        end
      end

      @songs = Song.ransack(name_cont: q10).result
    end

    render :results.filter()
  end
end
