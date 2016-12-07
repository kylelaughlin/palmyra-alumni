class RsvpPolicy < ApplicationPolicy

  def index?
    @user && @user.admin?
  end

  def new?
    @user
  end

  def create?
    @user
  end

  def show?
    @user.id == resource.classmate_id
  end

  def edit?
    @user.id == resource.classmate_id || @user.admin?
  end

  def update?
    @user.id == resource.classmate_id || @user.admin?
  end

  def destroy?
    @user.id == resource.classmate_id || @user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
