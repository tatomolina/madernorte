class AreaPolicy < ApplicationPolicy

  def index?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

  def show?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

  def destroy?
    (user.present?) && (user.has_role? :admin)
  end

end
