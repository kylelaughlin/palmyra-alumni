class Rsvp < ApplicationRecord

  has_many    :attendees, inverse_of: :rsvp
  belongs_to  :event, optional: true
  belongs_to  :classmate

  validates :classmate_id, presence: true

  accepts_nested_attributes_for :attendees, reject_if: :all_blank

  after_create :compute_total_cost


  private

  def compute_total_cost
    total_cost = 0
    self.attendees.each do |a|
      total_cost += a.price
    end
    self.total_cost = total_cost
    self.save
  end

end
