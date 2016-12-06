class EventOption < ApplicationRecord

  has_many    :attendees
  belongs_to  :event

  validates :name, presence: true
  validates :price, presence: true

  before_create :price_conversion

  private

  def price_conversion
    self.price *= 100
  end

end
