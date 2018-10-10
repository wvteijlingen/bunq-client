module Bunq
  ##
  # https://doc.bunq.com/api/1/call/monetary-account-joint
  class MonetaryAccountJoints < MonetaryAccounts
    def initialize(parent_resource)
      @resource = parent_resource.append("/monetary-account-joint")
    end
  end
end
