class ClassmatesController < ApplicationController

  def index
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
