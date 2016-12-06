class EventOption < ApplicationRecord

  has_many    :attendees
  belongs_to  :event

  validates :name, presence: true
  validates :price, presence: true

  before_create :price_conversion_to_integer

  def name_with_price
    "#{self.name}: $#{self.price/100}"
  end

  private

  def price_conversion_to_integer
    self.price *= 100
  end



end
