module ApplicationHelper

  def current_class?(test_path)
    return 'active' if request.path == test_path
      ''
  end

  def priority?(priority)
    if ("Urgente" == priority.name)
      return 'table-danger'
    elsif ("Media" == priority.name)
      'table-warning'
    else
      ''
    end
  end

  def current_delivery
    if !session[:delivery_id].nil?
      Delivery.find(session[:delivery_id])
    else
      Delivery.new
    end
  end
end
