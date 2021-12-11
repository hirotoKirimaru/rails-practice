class Term
  # TODO: 型をどこかで表現したい
  # attr_accessor -> どっちも。
  # attr_reader -> @Getter
  # attr_attr_writer -> @Setter

  #attr_reader :start_date
  #attr_reader :end_date

  attr_accessor :start_date, :end_date

  def initialize(start_date: Time.new, end_date: Time.new)
    @start_date = start_date
    @end_date = end_date
  end

  def is_not_daily_rate_term?
    true
  end
end
