class PagePolicy < ApplicationPolicy

  def home?
    @user
  end

end
