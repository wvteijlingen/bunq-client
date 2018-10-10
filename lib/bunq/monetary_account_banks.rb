module Bunq
  ##
  # https://doc.bunq.com/api/1/call/monetary-account-bank
  class MonetaryAccountBanks < MonetaryAccounts
    def initialize(parent_resource)
      @resource = parent_resource.append("/monetary-account-bank")
    end
  end
end
