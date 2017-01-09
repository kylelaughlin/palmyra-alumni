class PaypalUrlCreator

  def initialize(rsvp)
    @rsvp = rsvp
  end

  def call(return_path)
    set_invoice_id
    values = {
        business: "kylejlaughlin-facilitator@icloud.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{ENV['APP_HOST']}#{return_path}",
        invoice: @rsvp.invoice_id,
        amount: @rsvp.total_cost,
        item_name: @rsvp.event.name,
        item_number: @rsvp.id,
        quantity: '1',
        notify_url: "#{ENV['APP_HOST']}/hook"
    }
    "#{ENV['PAYPAL_HOST']}/cgi-bin/webscr?" + values.to_query
  end

  private

  def set_invoice_id
    loop do
      invoice_id = SecureRandom.urlsafe_base64 8
      @rsvp.invoice_id = invoice_id
      break if Rsvp.find_by_invoice_id(invoice_id).nil?
    end
    @rsvp.save
  end

end
