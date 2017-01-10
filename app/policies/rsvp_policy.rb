class RsvpPolicy < ApplicationPolicy

  def index?
    @user && @user.admin?
  end

  def new?
    @user && (@user.rsvps.where(event_id: record.event_id).empty? || @user.admin?)
  end

  def create?
    @user
  end

  def show?
    @user.id == resource.classmate_id
  end

  def edit?
    (@user.id == resource.classmate_id && @resource.payment_status != "Paid") || @user.admin?
  end

  def update?
    (@user.id == resource.classmate_id && @resource.payment_status != "Paid") || @user.admin?
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
