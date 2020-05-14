require "hypernova/faraday_connection"

require "async"

class Hypernova::FaradayRequest
  def self.post(payload)
    Async do
      Hypernova::FaradayConnection.build.post do |request|
        request.url(Hypernova::BatchUrlBuilder.path)
        request.headers["Content-Type"] = "application/json"
        request.body = payload[:body].to_json
      end
    end
  end
end
