class EventPolicy < ApplicationPolicy

  def index?
    @user
  end

  def new?
    @user && @user.admin?
  end

  def create?
    @user && @user.admin?
  end

  def show?
    @user
  end

  def edit?
    @user && @user.admin?
  end

  def update?
    @user && @user.admin?
  end

  def destroy?
    @user && @user.admin?
  end

end
