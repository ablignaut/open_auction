class BidsController < ApplicationController
  respond_to :js

  def new
    auction = Auction.find_by_id(params[:id])
    @bid = BidService.new(
      form: BidForm.new(auction: auction, user: current_user)
    ).perform

    if @bid.success?
      auction.reload

      Pusher.trigger(
        'auction',
        'my-event',
        {
          id: auction.id,
          ending: auction.ending,
          value: auction.current_value.float_to_currency
        }
      )
    else
      flash.now[:error] = @bid.errors.full_messages.first
    end
  end
end
