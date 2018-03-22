class ClientPolicy < ApplicationPolicy

  def index?
    true
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
