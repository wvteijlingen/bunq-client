require_relative 'resource'

module Bunq
  class UserPerson
    def initialize(client, id)
      @resource = Bunq::Resource.new(client, "/v1/user-person/#{id}")
    end

    def show
      @resource.with_session { @resource.get }['Response']
    end

    def update(user_person)
      @resource.with_session { @resource.put(user_person) }['Response']
    end
  end
end
