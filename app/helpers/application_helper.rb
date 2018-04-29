module ApplicationHelper

  def current_class?(test_path)
    return 'active' if request.path == test_path
      ''
  end

  def priority?(priority)
    if ("Urgente" == priority.name)
      'table-danger'
    elsif ("Media" == priority.name)
      'table-warning'
    else
      ''
    end
  end

  def article_on_delivery?(article)
    if (article.article_state.name == "En Camion")
      'table-primary'
    elsif (article.article_state.name == "Entregado")
      'table-success'
    elsif (article.article_state.name == "Cancelado")
      'table-danger'
    elsif (article.article_state.name == "Procesado")
      'table-warning'
    else
      ''
    end
  end

  def order_on_delivery?(order)
    if (order.articles_on_delivery.count > order.articles_delivered.count)
      'table-success'
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
