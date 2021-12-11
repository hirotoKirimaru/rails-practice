class Term
  @start_date
  @end_date 

  def initialize(start_date: Time.new, end_date: Time.new)
    @end = start_date
    @end = end_date
  end

  def is_not_daily_rate_term?
    true
  end
end
