class Rsvp < ApplicationRecord

  has_many    :attendees, inverse_of: :rsvp
  belongs_to  :event, optional: true
  belongs_to  :classmate

  validates :classmate_id, presence: true

  accepts_nested_attributes_for :attendees, reject_if: :all_blank, allow_destroy: true

  after_create :compute_total_cost

  def adjust_total_cost
    original_cost = self.total_cost
    new_cost = 0
    self.attendees.each do |a|
      new_cost += a.price
    end
    if new_cost < original_cost && self.payment_status != "Not Paid"
      self.update(payment_status: "Over Paid", total_cost: new_cost)
    elsif new_cost > original_cost && self.payment_status != "Not Paid"
      self.update(payment_status: "Extra Payment Due", total_cost: new_cost)
    elsif self.payment_status == "Not Paid"
      self.update(total_cost: new_cost)
    end
  end

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
