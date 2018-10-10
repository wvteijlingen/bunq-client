require_relative 'resource'
require_relative 'monetary_account'
require_relative 'monetary_accounts'
require_relative 'monetary_account_bank'
require_relative 'monetary_account_banks'
require_relative 'monetary_account_joint'
require_relative 'monetary_account_joints'
require_relative 'draft_share_invite_bank'
require_relative 'draft_share_invite_banks'
require_relative 'certificate_pinned'

module Bunq
  class User
    def initialize(client, id)
      @resource = Bunq::Resource.new(client, "/v1/user/#{id}")
    end

    def monetary_account(id)
      Bunq::MonetaryAccount.new(@resource, id)
    end

    def monetary_accounts
      Bunq::MonetaryAccounts.new(@resource)
    end

    def monetary_account_bank(id)
      Bunq::MonetaryAccountBank.new(@resource, id)
    end

    def monetary_account_banks
      Bunq::MonetaryAccountBanks.new(@resource)
    end

    def monetary_account_joint(id)
      Bunq::MonetaryAccountJoint.new(@resource, id)
    end

    def monetary_account_joints
      Bunq::MonetaryAccountJoints.new(@resource)
    end

    def draft_share_invite_bank(id)
      Bunq::DraftShareInviteBank.new(@resource, id)
    end

    def draft_share_invite_banks
      Bunq::DraftShareInviteBanks.new(@resource)
    end

    def certificate_pinned
      Bunq::CertificatePinned.new(@resource)
    end

    def show
      @resource.with_session { @resource.get }['Response']
    end
  end
end
