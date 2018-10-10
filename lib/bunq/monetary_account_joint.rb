module Bunq
  ##
  # https://doc.bunq.com/api/1/call/monetary-account-joint
  class MonetaryAccountJoint < MonetaryAccount
    def initialize(parent_resource, id)
      @resource = parent_resource.append("/monetary-account-joint/#{id}")
    end
  end
end
