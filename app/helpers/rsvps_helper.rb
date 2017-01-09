module RsvpsHelper

  def total_amount_paid(rsvp)
    rsvp.paid_amount.nil? ? 0 : rsvp.paid_amount
  end

end
