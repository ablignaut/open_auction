module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def bootstrap_icon_for flash_type
    {
      success: 'check-circle',
      error: 'times-circle',
      alert: 'warning',
      notice: 'info-circle'
    }[flash_type.to_sym] || 'question-sign'
  end

  def auction_status_to_literal(auction_ending)
    auction_ending ? 'SIM' : 'Não'
  end

  def link_to_menu(type, title, icon, url)
    raw("<li class='menu-item-depth-0'>#{link_to url, class: 'em-menu-link' do
     type == 0 ? raw("<span class=\"fa #{icon}\"></span> #{title}") : raw("<span><i class=\"fa fa-2x #{icon}\"></i><br />#{title}</span>")
     end}</li>")
  end
end
