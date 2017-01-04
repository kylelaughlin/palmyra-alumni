class PayRsvp

  def initialize(params, payment_method, rsvp)
    @params = params
    @payment_method = payment_method
    @rsvp = rsvp
  end

  def call
    if @payment_method == "paypal"
      process_paypal_payment
    elsif @payment_method == "cash"
      process_cash_payment
    end
  end

  private

  def process_paypal_payment
    paypal_verified = verify_paypal_params
  end

  def verify_paypal_params
    if verification_response == "VERIFIED"
      if @params["payment_status"] == "Completed"
        save_payment_details
      end
    end
  end

  def verification_response
    query_string = ""
    @params.each do |k,v|
      query_string += "&#{k}=#{v}"
    end
    url = URI.parse("#{ENV["PAYPAL_HOST"]}/cgi-bin/webscr?cmd=_notify-validate#{query_string}")
    res = Net::HTTP.get(url)
  end

  def save_payment_details
    @rsvp.update(payment_status: "Paid", payment_on: Date.today, paypal_payment_status: @params["payment_status"], paid_amount: paypal_paid_amount)
  end

  def paypal_paid_amount
    @params["mc_gross"].to_i * 100
  end

end
