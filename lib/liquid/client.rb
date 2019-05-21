module Liquid
  class Client
    attr_reader :token, :secret

    def initialize(token, secret)
      signature = signature(token, secret)
      request = Net::HTTP::Get.new(path)
      request.add_field('X-Quoine-API-Version', '2')
      request.add_field('X-Quoine-Auth', signature)
      request.add_field('Content-Type', 'application/json')
      http.request(request)
    end

    def http
      uri = URI.parse("https://api.liquid.com")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http
    end

    def path
      '/orders?product_id=1'
    end

    def signature(token, secret)
      auth_payload = {
        path: path,
        nonce: DateTime.now.strftime('%Q'),
        token_id: token
      }

      JWT.encode(auth_payload, secret, 'HS256')
    end

  end  
end
