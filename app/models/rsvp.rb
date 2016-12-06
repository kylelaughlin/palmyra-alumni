class Rsvp < ApplicationRecord

  has_many    :attendees
  belongs_to  :event

  validates :classmate_id, presence: true

end
