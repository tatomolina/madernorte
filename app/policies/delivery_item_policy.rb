class DeliveryItemPolicy < ApplicationPolicy

  def create?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

  def destroy?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

end
