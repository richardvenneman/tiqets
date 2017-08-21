WebMock.disable_net_connect!(allow_localhost: true)

module MockTiqets
  include WebMock::API

  def before_setup
    stub_request(:get, 'https://api.tiqets.com/v2/products/973698?lang=nl&currency=EUR')
      .with(headers: default_headers)
      .to_return(status: 200, body: File.new('test/fixtures/product_nl_eur.json'))

    stub_request(:get, 'https://api.tiqets.com/v2/products/1?lang=nl&currency=EUR')
      .with(headers: default_headers)
      .to_return(status: 404,
                 body: File.new('test/fixtures/errors/product.json'))

    stub_request(:get, 'https://api.tiqets.com/v2/products/1?lang=nl&currency=EUR')
      .with(headers: default_headers.merge(
        'Authorization' => 'Token faulty_api_key'
      ))
      .to_return(status: 401,
                 body: File.new('test/fixtures/errors/authorization.json'))

    super
  end

  private

  def default_headers
    {
      'Authorization' => 'Token test_api_key',
      'Connection' => 'close',
      'Host' => 'api.tiqets.com',
      'User-Agent' => 'http.rb/2.2.2'
    }
  end
end

class Minitest::Test
  include MockTiqets
end
