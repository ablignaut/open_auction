module Admin
  class AuctionsController < Admin::ApplicationController
    def index
      @auctions = Auction.all.order('created_at DESC').paginate(
        page: params[:page], per_page: 10
      )
    end

    def new
      @auction = Auction.new
      @auction.start_value = @auction.start_value.float_to_currency
      @auction.ending_value = @auction.ending_value.float_to_currency
    end

    def create
      @auction = Auction.new(permitted_params)
      @auction.current_value = @auction.start_value

      if @auction.save
        flash[:notice] = 'Lote cadastrado com sucesso'

        redirect_to admin_root_path
      else
        @auction.start_value = @auction.start_value.float_to_currency
        @auction.ending_value = @auction.ending_value.float_to_currency

        flash.now[:error] = @auction.errors.full_messages.first

        render :new
      end
    end

    private

    def permitted_params
      params[:auction][:start_value] = params[:auction][:start_value]
                                       .currency_to_float
      params[:auction][:ending_value] = params[:auction][:ending_value]
                                        .currency_to_float
      params.require(:auction).permit(
        :description, :start_value, :ending_value, :name, :image
      )
    end
  end
end
