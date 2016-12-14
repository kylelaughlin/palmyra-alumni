module ApplicationHelper

  def class_years
    this_year = Time.now.year
    classes = []
    classes << this_year
    100.times do |i|
      classes << (this_year - 1)
      this_year -= 1
    end
    classes
  end

  def money price
    "$#{number_with_precision(price / 100, precision: 2)}"
  end

end
