module Liquid
  class Client
    attr_reader :http, :token_id, :user_secret, :path

    URL = "https://api.liquid.com"

    def initialize(token, secret)
      @http = http
      @token_id = token || ENV["LIQUID_KEY"]
      @user_secret = secret || ENV["LIQUID_SECRET"]
    end

    def product
      @path = '/products'
      request
    end

    def product_detail(pair)
      product.select{|p|
        p["currency_pair_code"] == pair
      }.first
    end

    def product_id(pair)
      product_detail(pair)["id"]
    end

    def product_id(pair)
      product_detail(pair)["id"]
    end

    def product_id(pair)
      product_detail(pair)["id"]
    end

    def taker_buy_price(pair)
      product_detail(pair)["market_bid"].to_f
    end

    def taker_sell_price(pair)
      product_detail(pair)["market_ask"].to_f
    end

    private
      def http
        uri = URI.parse(URL)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http
      end


      def request
        request = Net::HTTP::Get.new(path)
        request.add_field('X-Quoine-API-Version', '2')
        request.add_field('X-Quoine-Auth', signature)
        request.add_field('Content-Type', 'application/json')
        response = http.request(request)
        # TODO: error handling
        JSON.parse(response.body)
      end

      def auth_payload
        {
          path: path,
          nonce: DateTime.now.strftime('%Q'),
          token_id: token_id
        }
      end

      def signature
        JWT.encode(auth_payload, user_secret, 'HS256')
      end
  end  
end
