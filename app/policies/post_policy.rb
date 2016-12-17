class PostPolicy < ApplicationPolicy

  def new?
    @user
  end

  def create?
    @user
  end

  def show?
    @user
  end

  def edit?
    @user && (@user.id == @record.classmate_id || @user.admin?)
  end

  def update?
    @user && (@user.id == @record.classmate_id || @user.admin?)
  end

  def destroy?
    @user && (@user.id == @record.classmate_id || @user.admin?)
  end

end
