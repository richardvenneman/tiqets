require 'test_helper'

class TiqetsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tiqets::VERSION
  end

  def test_default_api
    assert_raises KeyError do
      Tiqets.default_api
    end

    ENV['TIQETS_API_KEY'] = 'test_api_key'

    assert_kind_of Tiqets::Client, Tiqets.default_api

    ENV['TIQETS_API_KEY'] = nil
  end
end
