class BidService < ApplicationService
  def initialize(form: nil)
    @form = form
  end

  def perform
    form.save

    result_struct.new(form.auction, form.user, form.errors)
  end

  private

  attr_reader :form

  def result_struct
    create_struct(:auction, :user)
  end
end
