class AreaPolicy < ApplicationPolicy

  def index?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

  def create?
     (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

  def new?
    create?
  end

  def update?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

  def edit?
    update?
  end

  def destroy?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

end
