module EventOptionsHelper
  def money price
    "$#{price / 100}"
  end
end
