class EventOption < ApplicationRecord

  has_many    :attendees
  belongs_to  :event

  validates :name, presence: true
  validates :price, presence: true


  def name_with_price
    "#{self.name}: $#{self.price}"
  end



end
