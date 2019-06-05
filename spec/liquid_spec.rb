RSpec.describe Liquid do
  it "has a version number" do
    expect(Liquid::VERSION).to eq("0.1.0")
  end

  context ".product_detail" do
    let(:pair) { "BTCJPY" }
    let(:res) { Liquid.new.product_detail(pair) }
    it "currency_pair_code should be args" do
      expect(res["currency_pair_code"]).to eq(pair)
    end
  end

  context ".product_id" do
    let(:pair) { "BTCJPY" }
    let(:id) { "5" }
    let(:res){ Liquid.new.product_id(pair) }
    it "BTCJPY's id is 5" do
      expect(res).to eq(id)
    end
  end
end
