class OrderPolicy < ApplicationPolicy

  def index?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin) || (user.has_role? :worker))
  end

  def worker_index?
    (user.present?) && ((user.has_role? :worker) || (user.has_role? :vendor) || (user.has_role? :admin))
  end

  def worker_show?
    (user.present?) && (user.has_role? :worker)
  end

  def create?
     (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

  def new?
    create?
  end

  def update?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin) || (user.has_role? :worker))
  end

  def edit?
    update?
  end

  def worker_edit?
    (user.present?) && (user.has_role? :worker)
  end

  def destroy?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

end
