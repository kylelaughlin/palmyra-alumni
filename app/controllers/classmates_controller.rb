class ClassmatesController < ApplicationController

  def index
    @classmates = []
    @graduates = []
    if params[:class]
      @classmates = Classmate.where(class_year: params[:class])
      @graduates = Graduate.where(class_year: params[:class])
    else
      @classmates = Classmate.where(class_year: current_classmate.class_year)
      @graduates = Graduate.where(class_year: current_classmate.class_year)
    end
    @class_year = params[:class] || current_classmate.class_year
  end

  def show
    @classmate = Classmate.find(params[:id])
  end

  def destroy
    @classmate = Classmate.find(params[:id])
    @classmate.destroy
  end

end
