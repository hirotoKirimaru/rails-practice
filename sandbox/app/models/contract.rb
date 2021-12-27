# frozen_string_literal: true

# contractDate(契約日):datetime
# expireDate(解約日):datetime
class Contract
  attr_reader :contractDate
  attr_reader :expireDate

  def initialize(contractDate, expireDate)
    @contractDate = contractDate
    @expireDate = expireDate
  end

  ##
  # 解約可能か
  # 日割とはならない契約日と解約日の関係であること
  #
  # @see https://nainaistar.hatenablog.com/entry/2021/05/02/120000
  def canExpire?
    return true if canExpireByStartOfMonth?
    return true if canExpireByHasEndOfMonth?
    canExpireByHasNotEndOfMonth?
  end

  private

  ##
  # 月の初日から起算する場合は、最終月の末日
  #
  def canExpireByStartOfMonth?
    return expireDate.next_day(1).day == 1 if contractDate.day == 1

    false
  end

  ##
  # 月の途中から起算し，最終月に応当日のある場合は、最終月の応当日の前日
  # -1日すると、月を跨ぐ可能性があるのでNG
  #
  def canExpireByHasEndOfMonth?
    contractDate.day == expireDate.next_day(1).day
  end

  ##
  # 月の途中から起算し，最終月に応当日のない場合は、最終月の末日
  #
  def canExpireByHasNotEndOfMonth?
    return expireDate.next_day(1).day == 1 if contractDate.day > expireDate.day

    false
  end

end
