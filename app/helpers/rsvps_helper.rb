module RsvpsHelper

  def total_amount_paid(rsvp)
    rsvp.paid_amount.nil? ? 0 : rsvp.paid_amount / 100
  end

end
