WebMock.disable_net_connect!(allow_localhost: true)

module MockTiqets
  include WebMock::API

  def before_setup
    stub_request(:get, 'https://api.tiqets.com/v2/products/973698')
      .with(headers: default_headers)
      .to_return(status: 200, body: File.new('test/fixtures/product.json'))

    stub_request(:get, 'https://api.tiqets.com/v2/products/1')
      .with(headers: default_headers)
      .to_return(status: 200,
                 body: File.new('test/fixtures/errors/product.json'))

    super
  end

  private

  def default_headers
    {
      'Authorization' => 'Authorization: Token test_api_key',
      'Connection' => 'close',
      'Host' => 'api.tiqets.com',
      'User-Agent' => 'http.rb/2.2.2'
    }
  end
end

class Minitest::Test
  include MockTiqets
end
