class BidForm
  include ApplicationForm

  attribute :auction
  attribute :user

  validate :presence_of_auction
  validate :presence_of_user
  validate :auction_active

  private

  def persist!
    create_bid!
    update_current_value!
  end

  def create_bid!
    bid = Bid.new(
      user: user,
      auction: auction,
      value: bid_value
    )

    bid.save(validate: false)
  end

  def update_current_value!
    auction_obj = auction
    auction_obj.current_value = bid_value
    auction_obj.ending = true if current_value_is_greater_than_ending_value

    auction_obj.save(validate: false)
  end

  def current_value_is_greater_than_ending_value
    auction.current_value > auction.ending_value
  end

  def bid_value
    auction.current_value + (auction.current_value * 10) / 100
  end

  def presence_of_user
    return if user.present?

    errors.add(:user, I18n.t('errors.messages.blank'))
  end

  def presence_of_auction
    return if auction.present?

    errors.add(:auction, I18n.t('errors.messages.blank'))
  end

  def auction_active
    return if auction.blank? || !auction.ending?

    errors.add(:auction, 'já encerrou')
  end
end
