class Term
  attr_reader :start_date
  attr_reader :end_date
  
  def initialize(start_date: Time.new, end_date: Time.new)
    @start_date = start_date
    @end_date = end_date
  end

  def is_not_daily_rate_term?
    true
  end
end
