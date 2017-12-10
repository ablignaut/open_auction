module ApplicationForm
  def self.included(base)
    base.class_eval do
      include ActiveModel::Conversion
      extend ActiveModel::Naming
      include ActiveModel::Validations
      include Virtus.model
    end
  end

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end
end
