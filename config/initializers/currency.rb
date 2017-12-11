class String
  def currency_to_float
    tr('.', '').tr(',', '.').to_f
  end

  def signed_currency_to_float
    gsub(/[^\d\,]/, '').tr(',', '.').to_f
  end
end

class Float
  def float_to_currency
    ActionController::Base.helpers.number_with_precision(self, precision: 2)
  end
end

class BigDecimal
  def float_to_currency
    ActionController::Base.helpers.number_with_precision(
      self.to_f, precision: 2
    )
  end
end
