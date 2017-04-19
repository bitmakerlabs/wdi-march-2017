class Track < ActiveRecord::Base

  SHORT = 180000
  LONG  = 360000

  scope :short,  -> { shorter_than_or_equal_to(SHORT) }
  scope :medium, -> { where('milliseconds > ? AND milliseconds < ?', SHORT, LONG) }
  scope :long,   -> { where('milliseconds >= ?', LONG) }
  scope :shorter_than_or_equal_to, -> (milliseconds) { where('milliseconds <= ?', milliseconds)}
  scope :starts_with, -> (first_char) { where('name ILIKE ?', "#{ first_char}%") }

  validates :name, presence: true
  validates :milliseconds, presence: true,
                           numericality: { greater_than: 0 }
  validates :unit_price, presence: true,
                         numericality: { greater_than_or_equal_to: 0.0 }

  validate :name_must_be_titleized

private

  def name_must_be_titleized
    first_char = name[0]
    first_char_is_not_upcased = (first_char != first_char.upcase)
    errors.add(:name, 'must be capitalized!') if first_char_is_not_upcased
  end

end
