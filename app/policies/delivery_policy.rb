class DeliveryPolicy < ApplicationPolicy

  def index?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

  def show?
    (user.present?) && ((user.has_role? :vendor) || (user.has_role? :admin))
  end

end
