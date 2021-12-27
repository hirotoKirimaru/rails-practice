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
  # 日割ではない
  #
  # @see https://nainaistar.hatenablog.com/entry/2021/05/02/120000
  def canExpire?
    canExpireStartOfMonth?
    canExpireMiddleOfMonth?
    canExpireEndOfMonth?
  end

  private

  def canExpireStartOfMonth?
    true
  end

  def canExpireMiddleOfMonth?
    true
  end

  def canExpireEndOfMonth?
    true
  end
  
end

# #  月の初日から起算する場合は、最終月の末日
# if (contractDate.getDayOfMonth() == 1) {
#   if (expireDate.plusDays(1).getDayOfMonth() == 1) {
#     return true;
#   }
#   }
#   // 月の途中から起算し，最終月に応当日のある場合は、最終月の応当日の前日
#   // -1日すると、月を跨ぐ可能性があるのでNG
#   if (contractDate.getDayOfMonth() == expireDate.plusDays(1).getDayOfMonth()) {
#     return true;
#   }
#
#   // 月の途中から起算し，最終月に応当日のない場合は、最終月の末日
#   if (contractDate.getDayOfMonth() > expireDate.getDayOfMonth()) {
#     if (expireDate.plusDays(1).getDayOfMonth() == 1) {
#       return true;
#     }
#     }
#
#     return false;
#     }
