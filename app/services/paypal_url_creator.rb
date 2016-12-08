class PaypalUrlCreator

  def initialize(rsvp)
    @rsvp = rsvp
  end

  def call(return_path)
    values = {
        business: "kylejlaughlin-facilitator@icloud.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{ENV['APP_HOST']}#{return_path}",
        invoice: @rsvp.id,
        amount: @rsvp.total_cost/100,
        item_name: @rsvp.event.name,
        item_number: @rsvp.id,
        quantity: '1'
    }
    "#{ENV['PAYPAL_HOST']}/cgi-bin/webscr?" + values.to_query
  end

end
