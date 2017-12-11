describe BidService do
  let(:auction) { FactoryBot.create(:auction) }
  let(:user) { FactoryBot.create(:user) }

  context 'invalid when' do
    it 'user is blank' do
      bid = BidService.new(form: BidForm.new(auction: auction))
      result = bid.perform

      expect(result.success?).to be(false)
      expect(result.errors[:user]).to include(I18n.t('errors.messages.blank'))
    end

    it 'auction is blank' do
      bid = BidService.new(form: BidForm.new(user: user))
      result = bid.perform

      expect(result.success?).to be(false)
      expect(result.errors[:auction]).to include(I18n.t('errors.messages.blank'))
    end

    it 'auction ended' do
      bid = BidService.new(
        form: BidForm.new(
          user: user,
          auction: FactoryBot.create(:auction, ending: true)
        )
      )
      result = bid.perform

      expect(result.success?).to be(false)
      expect(result.errors[:auction]).to include('já encerrou')
    end
  end

  context 'success when' do
    it 'bid amount is correct' do
      auction_obj = auction
      auction_obj.current_value = 100
      bid = BidService.new(
        form: BidForm.new(user: user, auction: auction_obj)
      )
      result = bid.perform

      expect(result.success?).to be(true)
      expect(Bid.first.value).to eq(110)
      expect(Auction.first.current_value).to eq(110)
    end

    it 'ending auction' do
      auction_obj = auction
      expect(auction_obj.ending).to eq(false)

      100.times do
        BidService.new(
          form: BidForm.new(user: user, auction: Auction.first)
        ).perform
      end

      expect(Auction.first.ending).to eq(true)
    end
  end
end
