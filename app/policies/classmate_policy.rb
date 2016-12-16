class ClassmatePolicy < ApplicationPolicy

  def index?
    @user
  end

  def show?
    @user
  end

  def destroy?
    @user && (@user.id == @record.id || @user.admin?)
  end

end
