class Auction < ApplicationRecord
  has_attached_file :image,
                    styles: {
                      thumb: ['400x400#'],
                      tiny: ['200x200#'],
                      mini: ['100x100#']
                    }

  validates :start_value,
            :current_value,
            :ending_value,
            :description,
            presence: true
  validates :image, attachment_presence: true
  validates :description,
            length: { maximum: 255 },
            allow_blank: true
  validates :start_value,
            :current_value,
            :ending_value,
            numericality: { greater_than: 0 },
            allow_blank: true
  validates :ending, inclusion: { in: [true, false] }
  validate :lower_ending_value

  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}
  validates_attachment_content_type :image,
                                    content_type: [
                                      'image/jpeg',
                                      'image/pjpeg',
                                      'image/jpg',
                                      'image/x-png',
                                      'image/png',
                                      'image/gif'
                                    ]
  private

  def lower_ending_value
    return if ending_value.blank? || current_value.blank? ||
              ending_value > current_value

    errors.add(:ending_value, 'ending_value must be greater than start_value')
  end
end
