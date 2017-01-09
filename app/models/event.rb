class Event < ApplicationRecord

  has_many :event_options, inverse_of: :event
  has_many :rsvps, inverse_of: :event

  validates :name, presence: true
  validates :date, presence: true
  validates :content, presence: true
  validates :time, presence: true
  validates :rsvp_by, presence: true
  validates :payment_instructions, presence: true
  validates :contact_email, presence: true

  accepts_nested_attributes_for :event_options, reject_if: :all_blank

  scope :upcoming, -> { where('date >= ?', DateTime.now)}
end
