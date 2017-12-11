class AuctionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @auctions = Auction.all.order('created_at DESC').paginate(
      page: params[:page], per_page: 10
    )
  end
end
