require 'rails_helper'

RSpec.describe Auction, type: :model do
  let(:auction) { FactoryBot.build(:auction) }

  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:start_value) }
  it { should validate_presence_of(:current_value) }
  it { should validate_presence_of(:ending_value) }

  it { should validate_length_of(:description).is_at_most(255) }

  it{ should validate_numericality_of(:start_value).is_greater_than(0) }
  it{ should validate_numericality_of(:current_value).is_greater_than(0) }
  it{ should validate_numericality_of(:ending_value).is_greater_than(0) }

  it 'current_value has invalid format' do
    auction_obj = auction
    auction_obj.current_value = 100,00
    auction_obj.valid?

    expect(auction_obj.errors[:current_value]).to include(
      I18n.t('errors.messages.not_a_number')
    )
  end

  it 'start_value has invalid format' do
    auction_obj = auction
    auction_obj.start_value = 100,00
    auction_obj.valid?

    expect(auction_obj.errors[:start_value]).to include(
      I18n.t('errors.messages.not_a_number')
    )
  end

  it 'ending_value has invalid format' do
    auction_obj = auction
    auction_obj.ending_value = 100,00
    auction_obj.valid?

    expect(auction_obj.errors[:ending_value]).to include(
      I18n.t('errors.messages.not_a_number')
    )
  end

  it 'ending_value has equal to or less than start_value' do
    auction_obj = auction
    auction_obj.start_value = 100,00
    auction_obj.ending_value = 100,00
    auction_obj.valid?

    expect(auction_obj.errors[:ending_value]).to include(
      'ending_value must be greater than start_value'
    )
  end
end
