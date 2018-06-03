require "test_helper"

class MinMaxSSLTest < Minitest::Test
  def setup
    uri = URI("https://www.shopify.com")
    @http = Net::HTTP.new(uri.host, uri.port)
    @http.use_ssl = true
    @http.open_timeout = 5
  end

  def test_min_version
    @http.min_version = :TLS1_2
    @http.get("/")
  end

  def test_max_version
    @http.max_version = :SSL3

    assert_raises ::OpenSSL::SSL::SSLError do
      @http.get("/")
    end
  end
end
