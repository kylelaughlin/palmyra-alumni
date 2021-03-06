class ClassmatesController < ApplicationController

  def index
    @classmates = []
    authorize Classmate
    @graduates = []
    @class_year = params[:class] || current_classmate.class_year
    if params[:class]
      @classmates = Classmate.where(class_year: params[:class])
      @graduates = Graduate.where(class_year: params[:class])
      render "classmates/index.js.erb"
    else
      @classmates = Classmate.where(class_year: current_classmate.class_year)
      @graduates = Graduate.where(class_year: current_classmate.class_year)
    end
  end

  def admin_index
    @classmates = Classmate.all
  end

  def show
    @classmate = Classmate.find(params[:id])
  end

  def destroy
    @classmate = Classmate.find(params[:id])
    @classmate.destroy
  end

end
