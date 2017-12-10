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
end
