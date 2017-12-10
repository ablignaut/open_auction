RSpec.describe Bid, type: :model do
  let(:bid) { FactoryBot.build(:bid) }

  it { should belong_to(:user) }
  it { should belong_to(:auction) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:auction) }
  it { should validate_presence_of(:value) }

  it{ should validate_numericality_of(:value).is_greater_than(0) }

  it 'value has invalid format' do
    bid_obj = bid
    bid_obj.value = 100,00
    bid_obj.valid?

    expect(bid_obj.errors[:value]).to include(
      I18n.t('errors.messages.not_a_number')
    )
  end
end
