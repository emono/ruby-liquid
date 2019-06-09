module Liquid
  class Client
    class InvalidArgument < StandardError; end

    attr_reader :http, :token_id, :user_secret, :path, :params
    attr_accessor :url

    

    def initialize(token, secret)
      @url = "https://api.liquid.com"
      @http = http
      @token_id = token || ENV["LIQUID_KEY"]
      @user_secret = secret || ENV["LIQUID_SECRET"]
    end

    # get
    def product
      @path = '/products'
      get_request
    end

    def product_detail(pair)
      product.select{|p|
        p["currency_pair_code"] == pair
      }.first
    end

    def product_id(pair)
      product_detail(pair)["id"].to_i
    end

    def taker_buy_price(pair)
      product_detail(pair)["market_bid"].to_f
    end

    def taker_sell_price(pair)
      product_detail(pair)["market_ask"].to_f
    end

    # post
    def create_order(order_type: "limit", pair: nil, side: nil, quantity: nil, price: nil)
      pair_id = product_id(pair)
      raise InvalidArgument if side.nil? || quantity.nil? || price.nil?
      @path = '/orders'
      @params = 
        {
          "order": {
            "order_type": order_type,
            "product_id": pair_id,
            "side": side,
            "quantity": quantity,
            "price": price
          }
        }.to_json
      post_request
    end

    private
      def http
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http
      end

      def get_request
        request = Net::HTTP::Get.new(path)
        request.add_field('X-Quoine-API-Version', '2')
        request.add_field('X-Quoine-Auth', signature)
        request.add_field('Content-Type', 'application/json')
        response = http.request(request)
        # TODO: error handling
        JSON.parse(response.body)
      end

      def post_request
        request = Net::HTTP::Post.new(path)
        request.body = @params
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
