module Bunq
  class ResponseError < StandardError
    attr_reader :code
    attr_reader :headers
    attr_reader :body

    def initialize(message = nil, code: nil, headers: nil, body: nil)
      @code = code
      @headers = headers || {}
      @body = body
      super(message)
    end

    # Returns the parsed body if it is a JSON document, nil otherwise.
    # @param opts [Hash] Optional options that are passed to `JSON.parse`.
    def parsed_body(opts = {})
      JSON.parse(@body, opts) if @body && @headers['content-type'] && @headers['content-type'].include?('application/json')
    end

    # Returns an array of errors returned from the API, or nil if no errors are returned.
    # @return [Array|nil]
    def errors
      json = parsed_body
      json ? json['Error'] : nil
    end

    def request_id
      @headers['x-bunq-client-request-id']&.first
    end

    def response_id
      @headers['x-bunq-client-response-id']&.first
    end

    def to_s
      reqid = request_id || 'nil'
      resid = response_id || 'nil'
      "#{super} - Body: #{body}, request id: #{reqid}, response id: #{resid}"
    end
  end

  class UnexpectedResponse < ResponseError; end
  class AbsentResponseSignature < ResponseError; end
  class TooManyRequestsResponse < ResponseError; end
  class Timeout < StandardError; end
end
