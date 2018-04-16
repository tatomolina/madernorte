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

  def article_on_delivery?(article)
    if ((true == article.on_delivery) && (false == article.delivered))
      return 'table-success'
    else
      ''
    end
  end

  def order_on_delivery?(order)
    if ((true == order.on_delivery?) && (false == order.delivered?))
      return 'table-success'
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
