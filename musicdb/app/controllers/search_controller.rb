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

    q2 = params[:q2]
    if !q2.nil?
      num = params['num_comp2']
      field = params['group_field2']
      cond = params['cond2']
      if field.is_a? Integer
        if !num.eql?""
          if num.eql?"<"
          end
          if num.eql?">"
          end
        end
      end

      if field.eql?"name"
        @groups = Group.ransack(name_cont: q2).result
      end
    end

    q3 = params[:q3]
    if !q3.nil?
      num = params['num_comp3']
      field = params['group_field3']
      cond = params['cond3']
      if field.is_a? Integer
        if !num.eql?""
          if num.eql?"<"
          end
          if num.eql?">"
          end
        end
      end

      @groups = Group.ransack(name_cont: q3).result
    end

    q4 = params[:q4]
    if !q4.nil?
      num = params['num_comp4']
      field = params['ind_field1']
      cond = params['cond4']
      if field.is_a? Integer
        if !num.eql?""
          if num.eql?"<"
          end
          if num.eql?">"
          end
        end
      end

      if field.eql?"name"
        @groups = Individual.ransack(name_cont: q4).result
      end
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

      @groups = Song.ransack(name_cont: q10).result
    end

    render :results
  end
end
