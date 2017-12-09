RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password) }

  it { should validate_length_of(:name).is_at_most(60) }
  it { should validate_length_of(:password).is_at_least(6).is_at_most(20) }

  context 'when the user is invalid because' do
    subject { user }
    it { should validate_uniqueness_of(:email).case_insensitive }

    it 'the password does not have only letters and numbers' do
      user_obj = user
      user_obj.password = Faker::Number.number(10)
      user_obj.valid?

      expect(user_obj.errors[:password]).to include(
        I18n.t('errors.messages.wrong_format_password')
      )
    end

    it 'email have a blank space' do
      user_obj = user
      user_obj.email = 'filipe @gmail.com'
      user_obj.valid?

      expect(user_obj.errors[:email]).to include(
        I18n.t('errors.messages.invalid')
      )
    end

    it 'email does not have a @' do
      user_obj = user
      user_obj.email = 'filipe.com'
      user_obj.valid?

      expect(user_obj.errors[:email]).to include(
        I18n.t('errors.messages.invalid')
      )
    end

    it 'email does not have a domain category' do
      user_obj = user
      user_obj.email = 'filipe@google'
      user_obj.valid?

      expect(user_obj.errors[:email]).to include(
        I18n.t('errors.messages.invalid')
      )
    end

    it 'email does have only domain' do
      user_obj = user
      user_obj.email = '@google.com'
      user_obj.valid?

      expect(user_obj.errors[:email]).to include(
        I18n.t('errors.messages.invalid')
      )
    end
  end
end
