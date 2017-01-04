class PagePolicy < ApplicationPolicy

  def home?
    @user
  end

  def admin_dashboard?
    @user.admin?
  end

end
