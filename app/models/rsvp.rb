class Rsvp < ApplicationRecord

  has_many    :attendees, inverse_of: :rsvp
  belongs_to  :event, optional: true

  validates :classmate_id, presence: true

  accepts_nested_attributes_for :attendees, reject_if: :all_blank

end
