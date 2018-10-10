module Bunq
  ##
  # https://doc.bunq.com/api/1/call/monetary-account-bank
  class MonetaryAccountBank < MonetaryAccount
    def initialize(parent_resource, id)
      @resource = parent_resource.append("/monetary-account-bank/#{id}")
    end
  end
end
