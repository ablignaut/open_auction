class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable

  validates :password,
            format: {
              with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{8,}\z/,
              message: I18n.t('errors.messages.wrong_format_password')
            }, allow_blank: true
end
