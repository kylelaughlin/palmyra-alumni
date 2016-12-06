class Attendee < ApplicationRecord

  belongs_to :rsvp
  belongs_to :event_option

  validates :name, presence: true
  validates :option_id, presence: true
  validates :rsvp_id, presence:true

end
