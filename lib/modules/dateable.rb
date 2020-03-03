module Dateable
  def package_date(date)
    [date[0], date[1], date[2], date[3]].map(&:to_i)
  end

  def squared_date_last_four(date)
    squared_date = (date.to_i ** 2)
    squared_date.to_s[-4..-1]
  end

  def generate_offsets(date = nil)
    date = Time.now.strftime("%0e%0m%y") if date.nil?
    date = squared_date_last_four(date)
    package_date(date)
  end
end
